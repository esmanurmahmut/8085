library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_interface is
    port (
        clk        : in  std_logic;                     -- Sistem saati (FF tetikleyicisi)
        reset_n    : in  std_logic;                     -- Asenkron reset (Aktif Low)
        
        -- 8085 Sinyalleri
        A          : in  std_logic_vector(15 downto 0); -- Tam Adres Yolu (A15-A0)
        D_in       : in  std_logic_vector(7 downto 0);  -- Veri Yolu
        io_m_bar   : in  std_logic;                     -- IO/M' (Aktif Low: Bellek İşlemi)
        wr_bar     : in  std_logic;                     -- WR' (Aktif Low: Yazma İşlemi)
        
        -- Çıkışlar
        led_out    : out std_logic_vector(7 downto 0)   -- LED'lere gidecek veri
    );
end entity led_interface;

architecture behavioral of led_interface is
    -- Hedef Adres: 0x80 (A15-A8 pinleri)
    constant LED_TARGET_ADDR_HIGH : std_logic_vector(7 downto 0) := x"80"; 
    
    signal cs_bar        : std_logic;     
    signal write_enable  : std_logic := '1';     
    signal led_data      : std_logic_vector(7 downto 0);

begin

    cs_bar <= '0' when A(7 downto 0) = LED_TARGET_ADDR_HIGH else '1';
    

    write_enable <= '0' when (cs_bar = '0' and wr_bar = '0' and io_m_bar = '1') else '1';

    process(clk, reset_n) 
    begin
        if reset_n = '1' then

            led_data <= (others => '0');
        elsif rising_edge(clk) then

            if write_enable = '0' then

                led_data <= D_in;
            end if;
        end if;
    end process;
    
    -- Çıkış Ataması
    led_out <= led_data;

end architecture behavioral;