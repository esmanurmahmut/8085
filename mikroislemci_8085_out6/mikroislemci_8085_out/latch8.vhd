-- latch yerine FF + CE (ALE seviye-aktifken örnekler)
library ieee;
use ieee.std_logic_1164.all;

entity latch8 is
  port(
    clk   : in  std_logic;                       -- tek saat: sistem clock
    ale   : in  std_logic;                       -- CE olarak kullanılacak
    ad_in : in  std_logic_vector(7 downto 0);    -- AD[7:0]
    a_low : out std_logic_vector(7 downto 0)     -- latched A[7:0]
  );
end entity;

architecture rtl of latch8 is
  signal reg_q : std_logic_vector(7 downto 0);
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if ale = '1' then              -- CE
        reg_q <= ad_in;
      end if;
    end if;
  end process;
  a_low <= reg_q;
end architecture;