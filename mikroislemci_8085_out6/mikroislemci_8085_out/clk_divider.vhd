library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_divider_1mhz is
    port (
        clk_in  : in  std_logic;   -- 50 MHz giriş
        reset_n : in  std_logic;   -- aktif low reset
        clk_out : out std_logic    -- 1 MHz çıkış
    );
end entity clk_divider_1mhz;

architecture rtl of clk_divider_1mhz is

    constant C_DIVIDER : integer := 50;
    constant C_HALF    : integer := C_DIVIDER / 2; -- 25

    signal counter    : integer range 0 to C_HALF - 1 := 0;
    signal clk_reg    : std_logic := '0';

begin

    process(clk_in, reset_n)
    begin
        if reset_n = '1' then
            counter <= 0;
            clk_reg <= '0';

        elsif rising_edge(clk_in) then
            if counter = C_HALF - 1 then
                counter <= 0;
                clk_reg <= not clk_reg;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_reg;

end architecture rtl;