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
16#0000# => x"3E",  -- MVI A, 01H
16#0001# => x"01",

16#0002# => x"D3",  -- OUT 80H
16#0003# => x"80",

16#0004# => x"06",  -- MVI B, FFH
16#0005# => x"FF",

16#0006# => x"0E",  -- MVI C, FFH
16#0007# => x"FF",

16#0008# => x"0D",  -- DCR C
16#0009# => x"C2",  -- JNZ 0008H
16#000A# => x"08",
16#000B# => x"00",

16#000C# => x"05",  -- DCR B
16#000D# => x"C2",  -- JNZ 0006H
16#000E# => x"06",
16#000F# => x"00",

16#0010# => x"3E",  -- MVI A, 02H
16#0011# => x"02",

16#0012# => x"D3",  -- OUT 80H
16#0013# => x"80",

16#0014# => x"06",  -- MVI B, FFH
16#0015# => x"FF",

16#0016# => x"0E",  -- MVI C, FFH
16#0017# => x"FF",

16#0018# => x"0D",  -- DCR C
16#0019# => x"C2",  -- JNZ 0018H
16#001A# => x"18",
16#001B# => x"00",

16#001C# => x"05",  -- DCR B
16#001D# => x"C2",  -- JNZ 0016H
16#001E# => x"16",
16#001F# => x"00",

16#0020# => x"C3",  -- JMP 0000H
16#0021# => x"00",
16#0022# => x"00",

    --16#0004# => x"06",  -- MVI B, FFH
    --6#0005# => x"FF",

    --16#0006# => x"0E",  -- MVI C, FFH
    

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