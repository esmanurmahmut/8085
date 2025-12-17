library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_divider is
    port (
        clk_in    : in  std_logic;              -- 50 MHz Giriş Saati
        reset_n   : in  std_logic;              -- Aktif low reset
        clk_out   : out std_logic               -- ~2.941 MHz Çıkış Saati
    );
end entity clk_divider;

architecture rtl of clk_divider is
    -- 17'ye bölmek için gereken en az bit sayısı: 5 (2^4=16, 2^5=32)
    constant C_DIV_RATIO : integer := 17;
    constant C_HALF_PERIOD_LOW : integer := (C_DIV_RATIO / 2);      -- 8
    constant C_HALF_PERIOD_HIGH : integer := (C_DIV_RATIO - C_HALF_PERIOD_LOW); -- 9
    
    -- Sayıcı için 5 bit yeterlidir.
    signal counter     : natural range 0 to C_DIV_RATIO - 1 := 0; 
    signal clk_toggle  : std_logic := '0';
    
begin
    
    process (clk_in, reset_n)
    begin
        if reset_n = '0' then
            -- Reset durumunda
            counter    <= 0;
            clk_toggle <= '0';
            
        elsif rising_edge(clk_in) then
            
            -- Yüksek periyot (9 çevrim) için sayıcı 0'dan 8'e kadar sayar (9 değer)
            if clk_toggle = '0' then
                if counter = C_HALF_PERIOD_HIGH - 1 then -- 8
                    clk_toggle <= '1'; -- Saati tersle
                    counter    <= 0;
                else
                    counter <= counter + 1;
                end if;
            
            -- Düşük periyot (8 çevrim) için sayıcı 0'dan 7'ye kadar sayar (8 değer)
            else -- clk_toggle = '1'
                if counter = C_HALF_PERIOD_LOW - 1 then -- 7
                    clk_toggle <= '0'; -- Saati tersle
                    counter    <= 0;
                else
                    counter <= counter + 1;
                end if;
            end if;
        end if;
    end process;
    
    -- Çıkış saati, clk_toggle sinyaliyle aynıdır.
    clk_out <= clk_toggle;
    
end architecture rtl;