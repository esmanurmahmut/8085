library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_8085_with_mem is
    port(
        clk        : in  std_logic;     -- Sistem saati
        reset_n    : in  std_logic;     -- Aktif 0 reset
        dbg_addr   : out std_logic_vector(9 downto 0);
        dbg_db     : out std_logic_vector(7 downto 0);
        dbg_rd     : out std_logic;
        dbg_wr     : out std_logic;
        cnm        : out std_logic;
         
        -- LED ÇIKIŞI (Led Interface'e bağlanacak)
        led_out    : out std_logic_vector(7 downto 0) 
    );
end entity top_8085_with_mem; 
   
architecture rtl of top_8085_with_mem is
    -- ** COMPONENT TANIMLARI **
	 component clk_divider -- YENI EKLEME
        port (
            clk_in    : in  std_logic;              
            reset_n   : in  std_logic;              
            clk_out   : out std_logic               
        );
    end component;
	 
    component cpu_8085 
        port (
            data_bus  : inout std_logic_vector(7 downto 0);
            add_bus   : out std_logic_vector(7 downto 0);
            cpu_reset : in  std_logic;
            s0, s1    : out std_logic;
            iomn      : out std_logic;
            ALE       : out std_logic;
            RESETOUT  : out std_logic;
            CLK_OUT   : out std_logic;
            clk       : in  std_logic;
            X1, X2    : in  std_logic;
            SOD, SID  : in  std_logic;
            HOLD      : in  std_logic;
            HOLDA     : out std_logic;
            TRAP, RST7_5, RST6_5, RST5_5, INTR : in std_logic;
            INTA      : out std_logic;
            READY     : in  std_logic;
            RDn, WRn  : out std_logic;
            cnm       : out std_logic
        ); 
    end component;

    component latch8
        port (
            clk   : in std_logic;
            ale   : in std_logic;
            ad_in : in std_logic_vector(7 downto 0);
            a_low : out std_logic_vector(7 downto 0)
        );
    end component;
    
    component memory32k -- (512 Byte RAM için uyarlanmıştır)
        port(
            cs_n    : in  std_logic;
            oe_n    : in  std_logic;
            we_n    : in  std_logic;
            addr    : in  std_logic_vector(8 downto 0); -- 9 Adres biti (512 Byte)
            data    : inout std_logic_vector(7 downto 0);
            clk     : in  std_logic;
            dbg_addr: out std_logic_vector(9 downto 0);
            dbg_db  : out std_logic_vector(7 downto 0);
            dbg_rd  : out std_logic;
            dbg_wr  : out std_logic
        );
    end component;

    -- LED Arayüzü Component Tanımı (FF+CE yapılı mandal içerir)
    component led_interface
        port (
            clk        : in  std_logic;
            reset_n    : in  std_logic;
            A          : in  std_logic_vector(15 downto 0); 
            D_in       : in  std_logic_vector(7 downto 0);
            io_m_bar   : in  std_logic; -- (iomn)
            wr_bar     : in  std_logic; -- (WRn)
            led_out    : out std_logic_vector(7 downto 0)
        );
    end component;
    -- ** SON COMPONENT TANIMLARI **

    -- CPU sinyalleri
	 signal cpu_clk_3mhz : std_logic;
	 
    signal data_bus    : std_logic_vector(7 downto 0);
    signal add_bus     : std_logic_vector(7 downto 0);
    signal ALE         : std_logic;
    signal RDn         : std_logic;
    signal WRn         : std_logic;
    signal iomn        : std_logic;
    signal s0, s1      : std_logic;
    signal RESETOUT    : std_logic;
    signal CLK_OUT     : std_logic;
    signal HOLDA       : std_logic;
    signal INTA        : std_logic;

    -- Latch ve adres
    signal a_low_latched : std_logic_vector(7 downto 0);
    signal A_full        : std_logic_vector(15 downto 0); -- A15..A0

    -- Bellek ara sinyalleri
    signal cs_n, oe_n, we_n : std_logic;
    
begin
    -- Tam adres hattı oluşturulması
    A_full <= add_bus & a_low_latched;  -- A15..A0

	 clk_div_i : entity work.clk_divider
        port map(
            clk_in    => clk,
            reset_n   => reset_n,
            clk_out   => cpu_clk_3mhz -- 3 MHz olarak kullanılacak
        );
	
    ----------------------------------------------------------------------------
    -- 1. 8085 Çekirdeği Instantiation
    ----------------------------------------------------------------------------
    cpu_i : entity work.cpu_8085
      port map(
          data_bus  => data_bus,
          add_bus   => add_bus,
          
          cpu_reset => not reset_n,
          s0        => s0,
          s1        => s1,
          iomn      => iomn,
          ALE       => ALE,
          RESETOUT  => RESETOUT,
          CLK_OUT   => CLK_OUT,
          
          clk       => cpu_clk_3mhz,
          X1        => '0',
          X2        => '0',
          
          SOD       => '0',
          SID       => '0',
          HOLD      => '0',
          HOLDA     => HOLDA,
          
          TRAP      => '0',
          RST7_5    => '0',
          RST6_5    => '0',
          RST5_5    => '0',
          INTR      => '0',
          INTA      => INTA,
          
          READY     => '1',
          RDn       => RDn,
          WRn       => WRn,
          cnm       => cnm
      );

    ----------------------------------------------------------------------------
    -- 2. A[7:0] Yakalama (Latch) Instantiation
    ----------------------------------------------------------------------------
    latch_i : entity work.latch8
      port map(
        clk       => cpu_clk_3mhz,
        ale       => ALE,
        ad_in     => data_bus,
        a_low     => a_low_latched
      );

    ----------------------------------------------------------------------------
    -- 3. RAM (512B) seçim mantığı: 0x0000-0x01FF (A15-A9='0' ve IOM̅='0')
    ----------------------------------------------------------------------------
    -- RAM'i seçmek için A15'ten A9'a kadar tüm adres bitleri sıfır olmalıdır (7 bit).
    cs_n <= '0' when (iomn = '0' and A_full(15 downto 9) = "0000000") else '1';
    oe_n <= RDn;
    we_n <= WRn;

    ----------------------------------------------------------------------------
    -- 4. Bellek (512B) instansı
    ----------------------------------------------------------------------------
    ram_i : entity work.memory32k
      port map(
          cs_n     => cs_n,
          oe_n     => oe_n,
          we_n     => we_n,
          -- RAM'in 9 bitlik adres portuna A8..A0 bağlanır.
          addr     => A_full(8 downto 0), 
          data     => data_bus,
          clk      => cpu_clk_3mhz,
          dbg_addr => dbg_addr,
          dbg_db   => dbg_db,
          dbg_rd   => dbg_rd,
          dbg_wr   => dbg_wr
      );

    ----------------------------------------------------------------------------
    -- 5. LED ARAYÜZÜ INSTANSI (Component Kullanılarak)
    ----------------------------------------------------------------------------
    -- LED'ler 0x80xx adresine haritalanmıştır (Mantık, led_interface içinde yer alır)
    led_i : component led_interface
        port map(
            clk        => cpu_clk_3mhz,
            reset_n    => reset_n,
            A          => A_full,      -- Tam adres hattı (A15-A0)
            D_in       => data_bus,    -- Veri hattı
            io_m_bar   => iomn,        -- Bellek/I/O sinyali
            wr_bar     => WRn,         -- Yazma sinyali (aktif low)
            led_out    => led_out      -- Ana entity çıkışına bağlanır
        );

end architecture rtl;