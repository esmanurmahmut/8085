-- memory32k.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory32k is
  port(
    cs_n    : in  std_logic;                         -- chip select (aktif 0)
    oe_n    : in  std_logic;                         -- output enable (aktif 0)
    we_n    : in  std_logic;                         -- write enable (aktif 0)
    addr    : in  std_logic_vector(8 downto 0);     -- 32KB -> 15 bit adres
    data    : inout std_logic_vector(7 downto 0);    -- veri busu
    clk     : in  std_logic;                         -- saat

    -- Debug çıkışları (1. yöntem)
    dbg_addr: out std_logic_vector(9 downto 0);     -- tam adres (A15=0 varsayımı)
    dbg_db  : out std_logic_vector(7 downto 0);      -- veri yolu gözlemi
    dbg_rd  : out std_logic;                         -- okuma çevrimi göstergesi (1=read)
    dbg_wr  : out std_logic                          -- yazma çevrimi göstergesi (1=write)
  );
end entity;

architecture rtl of memory32k is
  type ram_t is array (0 to 512-1) of std_logic_vector(7 downto 0);
  --signal ram  : ram_t := (
    --16#0000# => x"06",  -- MVI B,42h
    --16#0001# => x"42",
    --16#0002# => x"78",  -- MOV A,B
    --16#0003# => x"C3",  -- JMP 0003 (sonsuz döngü)
    --16#0004# => x"03",
    --16#0005# => x"00",
   -- others   => (others => '0')
  --);
    signal ram  : ram_t := (
    16#0000# => x"C3",  -- MVI A,AAh
    16#0001# => x"06",

    16#0002# => x"00",  
    16#0003# => x"00",

    16#0004# => x"00",  
    16#0005# => x"00",

    16#0006# => x"3E",  -- MOV M,A   ; [HL] -> 0x8000 adresine A yaz
    16#0007# => x"AA",  -- JMP 0007h
    16#0008# => x"00",
    --16#0009# => x"00",

    others   => (others => '0')
  );


  signal dout : std_logic_vector(7 downto 0);
  signal a_i  : integer range 0 to 512-1;
begin
  a_i <= to_integer(unsigned(addr));

  -- Senkron yazma
  process(clk)
  begin
    if rising_edge(clk) then
      if cs_n = '0' and we_n = '0' then
        ram(a_i) <= data;
      end if;
    end if;
  end process;

  -- Asenkron okuma (SRAM tarzı)
  dout <= ram(a_i);

  -- Üç durumlu çıkış (okumada RAM sürer, yazmada üç-durum)
  data <= dout when (cs_n = '0' and oe_n = '0' and we_n = '1') else (others => 'Z');

  ----------------------------------------------------------------
  -- DEBUG ÇIKIŞLARI (top seviyesine kadar bağlamayı unutma)
  ---------------------------
  dbg_addr <= '0' & addr;
  dbg_db   <= dout when (cs_n = '0' and oe_n = '0' and we_n = '1') else data;
  dbg_rd   <= '1' when (cs_n = '0' and oe_n = '0' and we_n = '1') else '0';
  dbg_wr   <= '1' when (cs_n = '0' and we_n = '0')                 else '0';

end architecture;