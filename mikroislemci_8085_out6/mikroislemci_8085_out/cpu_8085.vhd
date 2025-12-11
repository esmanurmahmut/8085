-- FILE NAME      : intel.vhd 
-- AUTHOR         : AVIRAL MITTAL 
-- AUTHOR'S EMAIL : avimit@yahoo.com 
-- Coyright       : Aviral Mittal 
--                              Philips Semiconductors Southampton, UK SO15 0DJ 
-- This VHDL code may be freely copied as long as the copyright note isn't removed from 
-- its header. Full affiliation of anybody modifying this file shall be added to the 
-- header prior to further distribution. 
-- 
--                    Copyright (C) 1998, Aviral Mittal 
--                    e-mail:     avimit@yahoo.com 

------------------ 
-- Following is the description of the Intel's 8085 like Microprocessor 
-- The Top Level entity is called "cpu_8085" 

-- 1). cpu_control    :It is the control logic of thr Processor 

-- 2). alu            :It is the Arithematic and Logic unit of the Processor 
    -- 2a). adder8       :It is 8 bit full adder used as the basic cell of alu 
       -- 2aI). FULLADD       :It is single bit full adder used as the basic cell of adder8 

-- 3a). pch            :It is the Program Counter(8 Most significant bits)used for 
                       --generating the memory address 
-- 3b). pcl            :It is the Program Counter(8 Least significant bits)used for 
                       --generating the memory address 
      --3aI).CELLPC    :It is the basic cell of the program counter. 

-- 4). SP              :It is the stack pointer register.It also has the capability 
                       --to count up,count down.(16 bit) 
-- 5). REG_ARR         :It is the pile of registers inside the Processor used for progermming 
      -- 5a). reg8     :It is the bacic 8 bit register 

-- 6). COUNTER05       :It is the sequence generator for the control unit. 
                       --It can count up and can be synchronously set to 0 
                       --upon the completion of an instruction 

-- 7). trans_latch     :It is the 8 bit transparent latch 

-- 8). MUX2X1_VEC      :It is 8 bit datapath selector 

-- 9). TRI_ARR         :It is the 8 bit tri-state datapath 

-- 10). add_latch_high :It is a latch to hold the higher 8 address bits 
  
  

------------------------------------------------------------ 
--DESIGN reg8 BEGINS here: SIMPLE n BIT REGISTER WITH Async Reset(Clear) 
------------------------------------------------------------ 
LIBRARY IEEE; 
use ieee.std_logic_1164.all; 

entity reg8 is 
     generic (n: integer:= 7); 
       port(data_in    : in std_logic_vector(n downto 0); 
            load       : in std_logic; 
            clrn       : in std_logic; 
            clk        : in std_logic; 
            data_out   : out std_logic_vector(n downto 0)); 
end reg8; 
  
  

architecture behav of reg8 is 
   begin 
     process(clk,clrn) 
     variable dat_all_1:std_logic_vector(n downto 0) ; 
     variable data_out_sig:std_logic_vector(n downto 0) ; 
         begin 
               if(clrn = '1') then 
                       if(clk = '1') and (clk'event) then -- +ive edge triggred 
                           if(load = '1')then 
                             data_out <= data_in ; 
                           end if; 
                       end if; 
                  elsif(clrn = '0') then  -- for async reset 
                     data_out <= (others => '0') ; 
                  end if; 
     end process; 
end behav ; 
------------------------------------------------------------ 
--DESIGN reg8 ENDS here 
------------------------------------------------------------ 
  
  
  
  
  
  

------------------------------------------------------------ 
--DESIGN pch BEGINS here:  PROGRAM COUNTER REGISTER MSBits 
--Features: Can count Up,Can load external data and start counting furthur 
--          Async Reset(Clear) 
------------------------------------------------------------ 
LIBRARY IEEE; 
use ieee.std_logic_1164.all; 

entity pch is 
     generic ( n : integer := 7 ); 
              port(count_out : out std_logic_vector(n downto 0) ; 
                   count_en  : in std_logic ; 
                   clk       : in std_logic ; 
                   clrn      : in std_logic ; 
                   dat_in    : in std_logic_vector(n downto 0) ; 
                   load_en   : in std_logic ); 
end pch ; 

architecture struct of pch is 
component CELLPC 
   port( C : out std_logic; 
         load_en, 
         count_en, 
         data_in, 
         clrn, 
         clk : in std_logic); 
end component ; 

signal count_out_sig : std_logic_vector(n downto 0) ; 
signal count_en_sig : std_logic_vector(n downto 0) ; 
   begin 
count_en_sig(0) <= count_en ; 
PC1: CELLPC port map( C         =>   count_out_sig(0) , 
                     load_en   =>   load_en , 
                     count_en  =>   count_en , 
                     data_in   =>   dat_in(0) , 
                     clrn      =>   clrn , 
                     clk       =>   clk ) ; 
  

G1: for i in n downto 1 generate 
    PC1: CELLPC port map( C         =>   count_out_sig(i) , 
                     load_en   =>   load_en , 
                     count_en  =>   count_en_sig(i) , 
                     data_in   =>   dat_in(i) , 
                     clrn      =>   clrn , 
                     clk       =>   clk ) ; 

count_en_sig(i) <= count_out_sig(i-1) and count_en_sig(i-1) ; 
   end generate ; 
count_out <= count_out_sig ; 
end struct ; 
------------------------------------------------------------ 
--DESIGN pch ENDS here 
------------------------------------------------------------ 
  
  
  
  
  
  
  
  

------------------------------------------------------------ 
--DESIGN pcl BEGINS here: PROGRAM COUNTER REGISTER LSBits 
------------------------------------------------------------ 
LIBRARY IEEE; 
use ieee.std_logic_1164.all; 

entity pcl is 
     generic ( n : integer := 7 ); 
              port(count_out : out std_logic_vector(n downto 0) ; 
                   OUT_to_PCH  : out std_logic; 
                   count_en  : in std_logic ; 
                   clk       : in std_logic ; 
                   clrn      : in std_logic ; 
                   dat_in    : in std_logic_vector(n downto 0) ; 
                   load_en   : in std_logic ); 
end pcl ; 

architecture struct of pcl is 
component CELLPC 
   port( C : out std_logic; 
         load_en, 
         count_en, 
         data_in, 
         clrn, 
         clk : in std_logic); 
end component ; 

signal count_out_sig : std_logic_vector(n downto 0) ; 
signal count_en_sig : std_logic_vector(n downto 0) ; 
   begin 
count_en_sig(0) <= count_en ; 
PC1: CELLPC port map( C         =>   count_out_sig(0) , 
                     load_en   =>   load_en , 
                     count_en  =>   count_en , 
                     data_in   =>   dat_in(0) , 
                     clrn      =>   clrn , 
                     clk       =>   clk ) ; 
  

G1: for i in n downto 1 generate 
    PC1: CELLPC port map( C         =>   count_out_sig(i) , 
                     load_en   =>   load_en , 
                     count_en  =>   count_en_sig(i) , 
                     data_in   =>   dat_in(i) , 
                     clrn      =>   clrn , 
                     clk       =>   clk ) ; 

count_en_sig(i) <= count_out_sig(i-1) and count_en_sig(i-1) ; 
   end generate ; 
OUT_to_PCH <= count_out_sig(7) and count_en_sig(7) ; 
count_out <= count_out_sig ; 
end struct ; 
------------------------------------------------------------ 
--DESIGN pcl ENDS here 
------------------------------------------------------------ 
  
  
  
  
  
  
  
  

------------------------------------------------------------ 
--DESIGN trans_latch BEGINS here 
------------------------------------------------------------ 
library ieee; 
use ieee.std_logic_1164.all; 
entity trans_latch is 
  port(in_dat : in std_logic_vector(7 downto 0); 
       load   : in std_logic ; 
       dat_out: out std_logic_vector(7 downto 0) ;
		 clk : in std_logic ); 
end trans_latch ; 

architecture behav of trans_latch is 
  begin 
   process(load,in_dat ,clk ) 
   begin 
	if (clk = '1') and (clk'event) then
      if(load = '1')then 
        dat_out <= in_dat; 
      end if ; 
	end if ; 
  end process ; 
end behav ; 
------------------------------------------------------------ 
--DESIGN trans_latch ENDS here 
------------------------------------------------------------ 
  
  

------------------------------------------------------------ 
--DESIGN FULLADD BEGINS here: One bit Full Adder 
------------------------------------------------------------ 
LIBRARY IEEE; 
use ieee.std_logic_1164.all; 
entity FULLADD is 
   port( 
      Z                              :  out   STD_LOGIC; 
      CO                             :  out   STD_LOGIC; 
      A                              :  in    STD_LOGIC; 
      B                              :  in    STD_LOGIC; 
      CI                             :  in    STD_LOGIC); 
end FULLADD; 

architecture behav of FULLADD is 
  begin 
    process(A,B,CI) 
      variable sel : std_logic_vector(2 downto 0) ; 
     begin 
      sel := A&B&CI ; 
      case sel is 
        when "000" => 
          CO <= '0' ; 
          Z  <= '0' ; 
        when "001" => 
          CO <= '0' ; 
          Z  <= '1' ; 
        when "010" => 
          CO <= '0' ; 
          Z  <= '1' ; 
        when "011" => 
          CO <= '1' ; 
          Z  <= '0' ; 
        when "100" => 
          CO <= '0' ; 
          Z  <= '1' ; 
        when "101" => 
          CO <= '1' ; 
          Z  <= '0' ; 
        when "110" => 
          CO <= '1' ; 
          Z  <= '0' ; 
        when "111" => 
          CO <= '1' ; 
          Z  <= '1' ; 
        when others => 
          CO <= 'X' ; 
          Z  <= 'X' ; 
      end case ; 
    end process ; 
end behav ; 
------------------------------------------------------------ 
--DESIGN FULLADD ENDS here 
------------------------------------------------------------ 
  
  
  
  

------------------------------------------------------------ 
--DESIGN adder8 BEGINS here : 8 bit adder using FULLADD as basic CELL 
------------------------------------------------------------ 
library ieee; 
use ieee.std_logic_1164.all; 

entity adder8 is 
  generic(n:integer := 7 ) ; 
  port( A_in : in std_logic_vector(n downto 0 ); 
        B_in : in std_logic_vector(n downto 0 ); 
        SUM  : out std_logic_vector(n downto 0 ); 
        cin  : in std_logic ; 
        ACY  : out std_logic ; 
        cout : out std_logic ) ; 
end adder8 ; 

architecture struct of adder8 is 
   component FULLADD 

   port( 
      Z                              :  out   STD_LOGIC; 
      CO                             :  out   STD_LOGIC; 
      A                              :  in    STD_LOGIC; 
      B                              :  in    STD_LOGIC; 
      CI                             :  in    STD_LOGIC); 
end component; 

   signal A_in_s :std_logic_vector(n downto 0 ); 
   signal B_in_s :std_logic_vector(n downto 0 ); 
   signal SUM_s  :std_logic_vector(n downto 0 ); 
   signal cin_s  :std_logic_vector(n downto 0 ); 
   signal cout_s :std_logic_vector(n downto 0 ); 
    begin 
   cin_s(0)  <= cin ; 
      ADD0: FULLADD port map (  Z   => SUM_s(0) , 
                            CO  => cout_s(0) , 
                            A   => A_in_s(0) , 
                            B   => B_in_s(0) , 
                            CI  => cin_s(0)) ; 
   G1 : for i in n downto 1 generate 
        ADD1: FULLADD port map( Z   => SUM_s(i) , 
                            CO  => cout_s(i) , 
                            A   => A_in_s(i) , 
                            B   => B_in_s(i) , 
                            CI  => cout_s(i-1)) ; 
     end generate ; 
SUM <= SUM_S ; 
cout <= cout_s(7) ; 
A_in_s <= A_in ; 
B_in_s <= B_in ; 
ACY <= cout_s(3) ; 
end struct ; 
------------------------------------------------------------ 
--DESIGN adder8 ENDS here 
------------------------------------------------------------ 
  
  
  
  
  
  

------------------------------------------------------------ 
--DESIGN alu BEGINS here 
------------------------------------------------------------ 
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all ; 

entity alu is 
      generic ( n : integer := 7 ; 
                s : integer := 3) ; 
      port(dat_a  : in std_logic_vector(n downto 0); 
           dat_b  : in std_logic_vector(n downto 0); 
           dat_out: out std_logic_vector(n downto 0); 
           cout   : out std_logic; 
           ACY    : out std_logic; 
           SIGN   : out std_logic; 
           PARITY : out std_logic; 
           ZERO   : out std_logic; 
           cin    : in std_logic; 
           op_sel : in std_logic_vector(s downto 0)); 
end alu; 
  
  

architecture behav of alu is 
   signal nd    : std_logic_vector(n downto 0 ); 
   signal A_in_s    : std_logic_vector(n downto 0 ); 
   signal B_in_s    : std_logic_vector(n downto 0 ); 
   signal dat_b_n_s : std_logic_vector(n downto 0 ); 
   signal dat_a_n_s : std_logic_vector(n downto 0 ); 
   signal B_in_s_r  : std_logic_vector(n downto 0 ); 
   signal A_in_s_r  : std_logic_vector(n downto 0 ); 
   signal SUM_s     : std_logic_vector(n downto 0 ); 
   signal cout_s    : std_logic ; 
component ADDER8 
  port( A_in : in std_logic_vector(n downto 0 ); 
        B_in : in std_logic_vector(n downto 0 ); 
        SUM  : out std_logic_vector(n downto 0 ); 
        cin  : in std_logic ; 
        ACY  : out std_logic ; 
        cout : out std_logic ) ; 
end component; 

 begin 
A_in_s <= dat_a ; 
B_in_s <= dat_b ; 
dat_b_n_s <= not(dat_b) ; 
dat_a_n_s <= not(dat_a) ; 
A8_1 : adder8 port map (A_in => A_in_s_r , 
        B_in => B_in_s_r , 
        SUM  => SUM_s , 
        cin  => cin , 
        ACY  => ACY , 
        cout => cout_s) ; 

  process(dat_a, dat_b, op_sel, A_in_s, B_in_s, dat_b_n_s, dat_a_n_s, SUM_s, cout_s) 
  variable dat_xor_res:std_logic_vector(n downto 0) ; 
  variable dat_shr_res:std_logic_vector(n downto 0) ; 
  variable dat_xnor_res:std_logic_vector(n downto 0); 
  variable dat_and_res:std_logic_vector(n downto 0); 
  variable dat_nand_res:std_logic_vector(n downto 0); 
  variable dat_or_res:std_logic_vector(n downto 0); 
  variable dat_nor_res:std_logic_vector(n downto 0); 
  variable dat_out_var:std_logic_vector(n downto 0); 
  variable op_sel_int : integer := 0 ; 
  begin 
   op_sel_int := CONV_INTEGER(op_sel); 

  for i in n downto 0 loop 
   dat_xor_res(i) := dat_a(i) xor dat_b(i); 
  end loop; 

  for i in n-1 downto 0 loop 
   dat_shr_res(i) := dat_a(i+1) ; 
  end loop; 
   dat_shr_res(7) := '0' ; 

  for i in n downto 0 loop 
   dat_xnor_res(i) := not (dat_a(i) xor dat_b(i)); 
  end loop; 

  for i in n downto 0 loop 
   dat_and_res(i) := dat_a(i) and dat_b(i); 
  end loop; 

  for i in n downto 0 loop 
   dat_nand_res(i) := not (dat_a(i) and dat_b(i)); 
  end loop; 

  for i in n downto 0 loop 
   dat_or_res(i) := dat_a(i) or dat_b(i); 
  end loop; 

  for i in n downto 0 loop 
   dat_nor_res(i) := not (dat_a(i) or dat_b(i)); 
  end loop; dat_out <= dat_out_var ; 
PARITY <= dat_out_var(0) xor dat_out_var(1) xor dat_out_var(2) xor dat_out_var(3) xor dat_out_var(4) xor dat_out_var(5) xor dat_out_var(6) xor dat_out_var(7) ; 
nd <= dat_out_var ; 
end process; 
ZERO <= not (nd(0) and nd(1) and nd(2) and nd(3) and nd(4) and nd(5) and nd(6) and nd(7)) ; 
SIGN <= nd(7) ; 
end behav; 
------------------------------------------------------------ 
--DESIGN alu ENDS here 
------------------------------------------------------------ 
  
  
  
  
  
  

------------------------------------------------------------ 
--DESIGN CELLPC BEGINS here : It is the basic building block of pch and pcl 
------------------------------------------------------------ 
library ieee; 
use ieee.std_logic_1164.all; 

entity CELLPC is 

   port( C        : out std_ulogic; 
         load_en  :in std_logic ; 
         count_en :in std_logic ; 
         data_in  :in std_logic ; 
         clrn     :in std_logic ; 
         clk      :in std_logic ); 

end CELLPC; 

architecture behav of CELLPC is 
signal C_sig: std_logic ; 

signal net20, net10 ,net16 : std_ulogic; 

begin 
  process(load_en,count_en,data_in,clrn,clk) 
      variable sel : std_logic_vector(1 downto 0) ; 
    begin 
      sel := load_en&count_en ; 
		if (clrn = '0') then
        C_sig <= '0'; 
      elsif(rising_edge(clk)) then 
        case sel is 
          when "00" => 
            C_sig <= C_sig; 
          when "01" => 
            C_sig <= not(C_sig); 
          when "10" => 
            C_sig <= data_in; 
          when "11" => 
            C_sig <= not(C_sig); 
          when others => 
            null ; 
        end case ; 
      end if ; 
  end process ; 
C <= C_sig ; 
end behav ; 
------------------------------------------------------------ 
--DESIGN CELLPC ENDS here 
------------------------------------------------------------ 
  
  
  
  
  
  

------------------------------------------------------------ 
--DESIGN SP BEGINS here: It is the stack pointer register(16 bits) 
--Features: Async Reset(clear),Can count up,Can count Down,Load parallel data 
------------------------------------------------------------ 
library ieee; 
use ieee.std_logic_1164.all; 

entity SP is 
  port(c_en : in std_logic ;  -- it enables count(up or down) 
       clk  : in std_logic ; 
       lo_hi   : in std_logic ; 
       lo_lo   : in std_logic ; 
       clrn : in std_logic ; 
       dat_in : in std_logic_vector(7 downto 0 ); -- parallel data 
       SPL_OUT : out std_logic_vector(7 downto 0 ); 
       SPH_OUT : out std_logic_vector(7 downto 0 )); 
end SP ; 

architecture behav of SP is 
         signal c_out_var  : std_logic_vector(15 downto 0 ) ; 
  begin 
    process(clk,c_en,clrn,lo_hi,lo_lo,dat_in) 
         variable toggle_bit_inr : std_logic_vector(15 downto 0 ) ; 
         variable toggle_bit_dcr : std_logic_vector(15 downto 0 ) ; 
         variable sel            : std_logic_vector(2 downto 0 ) ; 
        begin 
         if(clrn = '0') then 
              c_out_var <= "0000000000000000" ; 
          else if(rising_edge(clk)) then 
              toggle_bit_inr(0) := c_en ; 
              toggle_bit_dcr(0) := c_en ; 
              for j in 1 to 15 loop 
                  toggle_bit_inr(j) := toggle_bit_inr(j-1) and c_out_var(j-1); 
                  toggle_bit_dcr(j) := toggle_bit_dcr(j-1) or  c_out_var(j-1); 
              end loop ; 

              for j in 0 to 15 loop 
                      if (toggle_bit_inr(j) = '1' or toggle_bit_dcr(j) = '0') then 
                         c_out_var(j) <= not (c_out_var(j)); 
                      end if ; 
              end loop ; 
          sel := lo_hi&lo_lo&c_en ; 
          case sel is 
            when "011" => 
              for i in 7 downto 0 loop 
               c_out_var(i) <= dat_in(i) ; 
               c_out_var(i+8) <= c_out_var(i+8) ; 
              end loop ; 
            when "101" => 
              for i in 7 downto 0 loop 
               c_out_var(i+8) <= dat_in(i) ; 
               c_out_var(i) <= c_out_var(i) ; 
              end loop ; 
            when "000"  => 
               c_out_var <= c_out_var ; 
            when others  => 
               null ; 
          end case ; 
          end if ; 
         end if ; 
    end process ; 
          SPL_OUT <= c_out_var(7)&c_out_var(6)&c_out_var(5)&c_out_var(4)&c_out_var(3)&c_out_var(2)&c_out_var(1)&c_out_var(0); 
          SPH_OUT <= c_out_var(15)&c_out_var(14)&c_out_var(13)&c_out_var(12)&c_out_var(11)&c_out_var(10)&c_out_var(9)&c_out_var(8); 
end behav ; 
------------------------------------------------------------ 
--DESIGN SP ENDS here 
------------------------------------------------------------ 
  
  
  
  
  
  
  

------------------------------------------------------------ 
--DESIGN REG_ARR BEGINS here 
------------------------------------------------------------ 
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all ; 
entity REG_ARR is 
generic ( n : integer := 7 ; 
          s : integer := 4); 
port ( DAT_IN    : in std_logic_vector(n downto 0) ; 
       DAT_IN_FL : in std_logic_vector(n downto 0) ; 
       LOAD_FL   : in std_logic ; 
       clrn      : in std_logic ; 
       clk       : in std_logic ; 
       INR_PC    : in std_logic ; 
       DCR_SP    : in std_logic ; 
       DAT_OUT   : out std_logic_vector(n downto 0) ; 
       COUNT_OUT : out std_logic_vector(n downto 0) ; 
       A_OUT     : out std_logic_vector(n downto 0) ; 
       B_OUT     : out std_logic_vector(n downto 0) ; 
       C_OUT     : out std_logic_vector(n downto 0) ; 
       D_OUT     : out std_logic_vector(n downto 0) ; 
       E_OUT     : out std_logic_vector(n downto 0) ; 
       F_OUT     : out std_logic_vector(n downto 0) ; 
       H_OUT     : out std_logic_vector(n downto 0) ; 
       L_OUT     : out std_logic_vector(n downto 0) ; 
       SPH_OUT   : out std_logic_vector(n downto 0) ; 
       SEL_IN    : in std_logic_vector(s downto 0) ; 
       SEL_OUT   : in std_logic_vector(s downto 0)) ; 
end REG_ARR ; 

architecture behav of REG_ARR is 
component SP 
  port(c_en : in std_logic ; 
       clk  : in std_logic ; 
       lo_hi   : in std_logic ; 
       lo_lo   : in std_logic ; 
       clrn : in std_logic ; 
       dat_in : in std_logic_vector(7 downto 0 ); 
       SPL_OUT : out std_logic_vector(7 downto 0 ); 
       SPH_OUT : out std_logic_vector(7 downto 0 )); 
end component ; 

component reg8 
--       generic (n: integer:= 7); 
       port(data_in    : in std_logic_vector(n downto 0); 
            load       : in std_logic; 
            clrn       : in std_logic; 
            clk        : in std_logic; 
            data_out   : out std_logic_vector(n downto 0)); 
end component ; 

component pch 
   generic( n : Integer := 7); 
   port( count_out : out std_logic_vector (7 downto 0); 
         count_en, clk, clrn : in std_logic; 
         dat_in : in std_logic_vector (7 downto 0);  load_en :in std_logic); 
end component; 
  

component pcl 
     generic ( n : integer := 7 ); 
              port(count_out : out std_logic_vector(n downto 0) ; 
                   OUT_to_PCH  : out std_logic; 
                   count_en  : in std_logic ; 
                   clk       : in std_logic ; 
                   clrn      : in std_logic ; 
                   dat_in    : in std_logic_vector(n downto 0) ; 
                   load_en   : in std_logic ); 
end component ; 
  

signal load_A : std_logic ; 
signal dat_out_regA : std_logic_vector(n downto 0); 

signal load_F : std_logic ; 
signal dat_out_regF : std_logic_vector(n downto 0); 

signal load_B : std_logic ; 
signal dat_out_regB : std_logic_vector(n downto 0); 

signal load_C : std_logic ; 
signal dat_out_regC : std_logic_vector(n downto 0); 

signal load_D : std_logic ; 
signal dat_out_regD : std_logic_vector(n downto 0); 

signal load_E : std_logic ; 
signal dat_out_regE : std_logic_vector(n downto 0); 

signal load_H : std_logic ; 
signal dat_out_regH : std_logic_vector(n downto 0); 

signal load_L : std_logic ; 
signal dat_out_regL : std_logic_vector(n downto 0); 

signal load_SPL : std_logic ; 
signal dat_out_regSPL : std_logic_vector(n downto 0); 

signal load_SPH : std_logic ; 
signal dat_out_regSPH : std_logic_vector(n downto 0); 

signal load_PCL : std_logic ; 
signal dat_out_regPCL : std_logic_vector(n downto 0); 

signal load_PCH : std_logic ; 
signal dat_out_regPCH : std_logic_vector(n downto 0); 

signal load_W : std_logic ; 
signal dat_out_regW : std_logic_vector(n downto 0); 

signal load_Z : std_logic ; 
signal dat_out_regZ : std_logic_vector(n downto 0); 

--signal load_VECTOR : std_logic_vector(13 downto 0); 

signal INR_PCH : std_logic ; 
--signal DCR_SPH : std_logic ; 
begin 

 REG_A:reg8 port map (data_in   => DAT_IN,   --1 
                      load      => load_A , 
                      clrn      => clrn , 
                      clk       => clk , 
                      data_out  => dat_out_regA ) ; 

 REG_F:reg8 port map (data_in   => DAT_IN_FL,  --2 
                      load      => load_FL , 
                      clrn      => clrn , 
                      clk       => clk , 
                      data_out  => dat_out_regF ) ; 

 REG_B:reg8 port map (data_in   => DAT_IN,   --3 
                      load      => load_B , 
                      clrn      => clrn , 
                      clk       => clk , 
                      data_out  => dat_out_regB ) ; 

 REG_C:reg8 port map (data_in   => DAT_IN,   --4 
                      load      => load_C , 
                      clrn      => clrn , 
                      clk       => clk , 
                      data_out  => dat_out_regC ) ; 

 REG_D:reg8 port map (data_in   => DAT_IN,   --5 
                      load      => load_D , 
                      clrn      => clrn , 
                      clk       => clk , 
                      data_out  => dat_out_regD ) ; 

 REG_E:reg8 port map (data_in   => DAT_IN,   --6 
                      load      => load_E , 
                      clrn      => clrn , 
                      clk       => clk , 
                      data_out  => dat_out_regE ) ; 

 REG_H:reg8 port map (data_in   => DAT_IN,   --7 
                      load      => load_H , 
                      clrn      => clrn , 
                      clk       => clk , 
                      data_out  => dat_out_regH ) ; 

 REG_L:reg8 port map (data_in   => DAT_IN,   --8 
                      load      => load_L , 
                      clrn      => clrn , 
                      clk       => clk , 
                      data_out  => dat_out_regL ) ; 
  

REG_SP : SP port map(c_en    => DCR_SP , 
                     clk     => clk , 
                     lo_hi   => load_SPH , 
                     lo_lo   => load_SPL , 
                     clrn    => clrn , 
                     dat_in  => DAT_IN , 
                     SPL_OUT => dat_out_regSPL , 
                     SPH_OUT => dat_out_regSPH ) ; 

 REG_PCL:pcl port map (dat_in    => DAT_IN,   --11 
                      OUT_to_PCH => INR_PCH , 
                      load_en    => load_PCL , 
                      count_en   => INR_PC , 
                      clrn       => clrn , 
                      clk        => clk , 
                      count_out  => dat_out_regPCL ) ; 

 REG_PCH:pch port map (dat_in   => DAT_IN,   --11 
                      load_en   => load_PCH , 
                      count_en  => INR_PCH , 
                      clrn      => clrn , 
                      clk       => clk , 
                      count_out => dat_out_regPCH ) ; 

 REG_W:reg8 port map (data_in   => DAT_IN,   --13 
                      load      => load_W , 
                      clrn      => clrn , 
                      clk       => clk , 
                      data_out  => dat_out_regW ) ; 

 REG_Z:reg8 port map (data_in   => DAT_IN,   --14 
                      load      => load_Z , 
                      clrn      => clrn , 
                      clk       => clk , 
                      data_out  => dat_out_regZ ) ; 

 process(DAT_IN,INR_PC,SEL_IN,SEL_OUT,clk,clrn) 
 variable load_VECTOR : std_logic_vector(13 downto 0); 
 variable DAT_OUT_var : std_logic_vector(n downto 0); 
 variable SEL_IN_INT : integer ;--:= 0 ; 
 variable SEL_OUT_INT : integer ;--:= 0 ; 
  begin 
   SEL_IN_INT := CONV_INTEGER(SEL_IN); 
   SEL_OUT_INT := CONV_INTEGER(SEL_OUT); 
   case SEL_IN_INT is 
     when 0 => 
     load_VECTOR := "00000000000001" ; 

     when 1 => 
     load_VECTOR := "00000000000010" ; 

     when 2 => 
     load_VECTOR := "00000000000100" ; 

     when 3 => 
     load_VECTOR := "00000000001000" ; 

     when 4 => 
     load_VECTOR := "00000000010000" ; 

     when 5 => 
     load_VECTOR := "00000000100000" ; 

     when 6 => 
     load_VECTOR := "00000001000000" ; 

     when 7 => 
     load_VECTOR := "00000010000000" ; 

     when 8 => 
     load_VECTOR := "00000100000000" ; 

     when 9 => 
     load_VECTOR := "00001000000000" ; 

     when 10 => 
     load_VECTOR := "00010000000000" ; 

     when 11 => 
     load_VECTOR := "00100000000000" ; 

     when 12 => 
     load_VECTOR := "01000000000000" ; 

     when 13 => 
     load_VECTOR := "10000000000000" ; 

     when 14 => 
     load_VECTOR := "00000000000000" ; 

     when others => 
     load_VECTOR := "00000000000000" ; 

end case ; 

   case SEL_OUT_INT is 
     when 7 => 
DAT_OUT_var := dat_out_regA ; 

     when 8 => 
DAT_OUT_var := dat_out_regF ; 

     when 0 => 
DAT_OUT_var := dat_out_regB ; 

     when 1 => 
DAT_OUT_var := dat_out_regC ; 

     when 2 => 
DAT_OUT_var := dat_out_regD ; 

     when 3 => 
DAT_OUT_var := dat_out_regE ; 

     when 4 => 
DAT_OUT_var := dat_out_regH ; 

     when 5 => 
DAT_OUT_var := dat_out_regL ; 

     when 9 => 
DAT_OUT_var := dat_out_regSPL ; 

     when 10 => 
DAT_OUT_var := dat_out_regSPH ; 

     when 11 => 
DAT_OUT_var := dat_out_regPCL ; 

     when 12 => 
DAT_OUT_var := dat_out_regPCH ; 

     when 13 => 
DAT_OUT_var := dat_out_regW ; 

     when 6 => 
DAT_OUT_var := dat_out_regZ ; 

     when others => 
DAT_OUT_var := dat_out_regPCL ; 

end case ; 
load_A   <= load_VECTOR(7) ; 
load_F <= load_VECTOR(8) ; 
load_B   <= load_VECTOR(0) ; 
load_C   <= load_VECTOR(1) ; 
load_D   <= load_VECTOR(2) ; 
load_E   <= load_VECTOR(3) ; 
load_H   <= load_VECTOR(4) ; 
load_L   <= load_VECTOR(5) ; 
load_SPL <= load_VECTOR(9) ; 
load_SPH <= load_VECTOR(10) ; 
load_PCL <= load_VECTOR(11) ; 
load_PCH <= load_VECTOR(12) ; 
load_W   <= load_VECTOR(13) ; 
load_Z   <= load_VECTOR(6) ; 
DAT_OUT  <= DAT_OUT_var ; 

end process ; 

COUNT_OUT <= dat_out_regPCH ; 
A_OUT     <= dat_out_regA; 
B_OUT     <= dat_out_regB; 
C_OUT     <= dat_out_regC; 
D_OUT     <= dat_out_regD; 
E_OUT     <= dat_out_regE; 
F_OUT     <= dat_out_regF; 
H_OUT     <= dat_out_regH; 
SPH_OUT   <= dat_out_regSPH; 
L_OUT     <= dat_out_regL; 
end behav ; 
------------------------------------------------------------ 
--DESIGN REG_ARR ENDS here 
------------------------------------------------------------ 
  
  
  
  
  
  
  

------------------------------------------------------------ 
--DESIGN MUX2X1_VEC BEGINS here 
------------------------------------------------------------ 
library ieee; 
use ieee.std_logic_1164.all; 

entity MUX2X1_VEC is 

   port( dat_out : out std_logic_vector(7 downto 0); 
         EN : in std_logic; 
         dat_in_b : in std_logic_vector(7 downto 0); 
         data_in : in std_logic_vector(7 downto 0)); 

end MUX2X1_VEC; 

architecture behav of MUX2X1_VEC is 
  begin 
   process(EN ,dat_in_b ,data_in) 
     variable EN_v : std_logic ; 
       begin 
           EN_v := EN ; 
           if(EN_v = '0') then 
             dat_out <= data_in ; 
           elsif(EN_v = '1') then 
             dat_out <= dat_in_b ; 
           end if ; 
   end process ; 
end behav ; 
------------------------------------------------------------ 
--DESIGN MUX2X1_VEC ENDS here 
------------------------------------------------------------ 
  
  
  
  
  
  

------------------------------------------------------------ 
--DESIGN TRI_ARR BEGINS here 
------------------------------------------------------------ 
library ieee; 
use ieee.std_logic_1164.all; 

entity TRI_ARR is 

   port( data_out : out std_logic_vector(7 downto 0) ; 
         EN : in std_ulogic; 
         data_in : in std_logic_vector(7 downto 0)); 
end TRI_ARR; 

architecture behav of TRI_ARR is 
 begin 
  process(EN,data_in) 
     variable data_out_var : std_logic_vector(7 downto 0); 
         begin 
           if(EN = '1') then 
             data_out_var := data_in ; 
           else 
             data_out_var := "ZZZZZZZZ"; 
           end if ;		  
data_out <= data_out_var ;
 
 end process ; 
end behav ; 
------------------------------------------------------------ 
--DESIGN TRI_ARR ENDS here 
------------------------------------------------------------ 
  
  
  
  
  
  
  

------------------------------------------------------------ 
--DESIGN COUNTER05 BEGINS here 
------------------------------------------------------------ 
library ieee; 
use ieee.std_logic_1164.all; 

entity COUNTER05 is 
  generic ( s : integer := 4 ); 
  port(clk         :   in std_logic ; 
       zero_en     :   in std_logic ; 
       c_en        :   in std_logic ; 
       clrn        :   in std_logic ; 
       C_OUT       :   out std_logic_vector(s downto 0)); 
end COUNTER05 ; 

architecture behav of COUNTER05 is 
     signal C_OUT_sig : std_logic_vector(s downto 0); 
  begin 
    process(c_en,zero_en,clrn,clk) 
         variable toggle_bit_inr : std_logic_vector(s downto 0 ) ; 
      begin 
        if(clrn = '0') then 
          C_OUT_sig <= (others => '0') ; 
        elsif(rising_edge(clk)) then 
          toggle_bit_inr(0) := c_en ; 

           for j in 1 to s loop 
                  toggle_bit_inr(j) := toggle_bit_inr(j-1) and C_OUT_sig(j-1); 
           end loop ; 

           for j in 0 to s loop 
                      if (toggle_bit_inr(j) = '1') then 
                         C_OUT_sig(j) <= not (C_OUT_sig(j)) ; 
                      end if ; 
           end loop ; 
         if(zero_en = '1') then 
           C_OUT_sig <= (others => '0') ; 
         end if ; 
        end if ; 
    end process ; 
C_OUT <= C_OUT_sig ; 
end behav ; 
------------------------------------------------------------ 
--DESIGN COUNTER05 ENDS here 
------------------------------------------------------------ 
  
  
  
  
  
  
  

------------------------------------------------------------ 
--DESIGN add_latch_high BEGINS here 
------------------------------------------------------------ 
library ieee; 
use ieee.std_logic_1164.all; 

entity add_latch_high is 
       generic (n: integer:= 7); 
 port(dat_pch : in std_logic_vector(7 downto 0) ; 
      dat_H   : in std_logic_vector(7 downto 0) ; 
      dat_B   : in std_logic_vector(7 downto 0) ; 
      dat_D   : in std_logic_vector(7 downto 0) ; 
      dat_SPH : in std_logic_vector(7 downto 0) ; 
      SEL     : in std_logic_vector(2 downto 0) ; 
      clk     : in std_logic ; 
      clrn    : in std_logic ; 
      load    : in std_logic ; 
      data_out   : out std_logic_vector(7 downto 0) ); 
end add_latch_high ; 

architecture behav of add_latch_high is 

component reg8 
--       generic (n: integer:= 7); 
       port(data_in    : in std_logic_vector(n downto 0); 
            load       : in std_logic; 
            clrn       : in std_logic; 
            clk        : in std_logic; 
            data_out   : out std_logic_vector(n downto 0)); 
end component ; 

  signal data_reg8 :std_logic_vector(n downto 0) ; 
  signal data_reg8_in :std_logic_vector(n downto 0) ; 

 begin 

LATCH_1:reg8 port map (data_in => data_reg8 , 
                       load    => load , 
                       clrn    => clrn , 
                       clk     => clk , 
                       data_out    => data_out ); 

   process(dat_SPH,sel,dat_pch,dat_H,dat_B,dat_D) 
    variable data_reg8_var : std_logic_vector(n downto 0);-- := "00000000"; 
      begin 
       case sel is 
         when  "000" => 
      data_reg8_var :=  dat_pch ; 

         when  "001" => 
      data_reg8_var :=  dat_B ; 

         when  "010" => 
      data_reg8_var :=  dat_D ; 

         when  "011" => 
      data_reg8_var :=  dat_H ; 

         when  "100" => 
      data_reg8_var :=  dat_SPH ; 

         when others => 
      data_reg8_var :=  "00000000"; 
       end case ; 
data_reg8 <= data_reg8_var ; 
   end process ; 
end behav ; 
------------------------------------------------------------ 
--DESIGN add_latch_high ENDS here 
------------------------------------------------------------ 
  
  
  
  
  
  
  
  
  

------------------------------------------------------------ 
--DESIGN cpu_control BEGINS here: HARD WIRED CONTROL UNIT 
------------------------------------------------------------ 
library ieee; 
use ieee.std_logic_1164.all; 

entity cpu_control is 
  port( 
        ID_OUT_S               : in std_logic_vector(7 downto 0) ; 
        DEC5X32_IN             : in std_logic_vector(4 downto 0) ; 
        clk                    : in std_logic ; 

       s0         : out std_logic ; 
       s1         : out std_logic ; 
       iomn       : out std_logic ; 
       RESETOUT   : out std_logic ; 
       CLK_OUT    : out std_logic ; 
       SOD        : in std_logic ; 
       SID        : in std_logic ; 
       HOLD       : in std_logic ; 
       HOLDA      : out std_logic ; 
       TRAP       : in std_logic ; 
       RST7_5     : in std_logic ; 
       RST6_5     : in std_logic ; 
       RST5_5     : in std_logic ; 
       INTR       : in std_logic ; 
       INTA       : out std_logic ; 
       ACY        : in std_logic ; 
       SIGN       : in std_logic ; 
       PARITY     : in std_logic ; 
       ZERO       : in std_logic ; 
       CY         : in std_logic ; 
       CIN        : out std_logic ; 
       LOAD_FL    : out std_logic ; 
       SEL_HI_ADD : out std_logic_vector(2 downto 0 ) ; 

        LATCH_LOW_ADD          : out std_logic ; 
        ZERO_SEQ_COUNTER       : out std_logic ; 
        ALE                    : out std_logic ; 
        RDn                    : out std_logic ; 
        WRn                    : out std_logic ; 
        OP_SEL                 : out std_logic_vector(3 downto 0) ; 
        SEL_DATAOUT_ALU_OUT    : out std_logic ; 
        EN_FROM_OUT            : out std_logic ; 
        LOAD_REG_T             : out std_logic ; 
        LOAD_REG_ID            : out std_logic ; 
        INR_PC                 : out std_logic ; 
        DCR_SP                 : out std_logic ; 
        EN_OUT_BUS             : out std_logic ; 
        EN_IN_BUS              : out std_logic ; 
        clkn                   : out std_logic ; 
        SEL_IN                 : out std_logic_vector(4 downto 0) ; 
        SEL_OUT                : out std_logic_vector(4 downto 0)) ; 
end cpu_control ; 

architecture behav of cpu_control is 
begin 
clkn <= not(clk) ; 
process(DEC5X32_IN, ID_OUT_S, TRAP, RST7_5, RST6_5, RST5_5, INTR, CY, SIGN, PARITY, ZERO) 
variable CONTROL_WORD : std_logic_vector(35 downto 0) ; 
variable INTR_WORD    : std_logic_vector(4 downto 0) ; 
  begin 
    INTR_WORD := TRAP&RST7_5&RST6_5&RST5_5&INTR ; 
    case DEC5X32_IN is 
    when "00000" => 
    case ID_OUT_S is 
       when  "11001101" => --  CALL 
         CONTROL_WORD := "010001000111011000000011010110011010" ; 

    when others => 
        CONTROL_WORD := "010001000111001000000011111110101110" ; 
    end case ; 

    --     CONTROL_WORD := "010001000111001000000011111110101110" ; 
--                        al ef ei eo ip li lt op_s  rn sd s_in   s_ou   wr z 
    when "00001" => 
      CASE INTR_WORD is 
       when "00001" => 
         CONTROL_WORD := "000000001110100110000011111110101110" ; 
       when others => 
         CONTROL_WORD := "000001000110100110000001111110101110" ; 
      end CASE ; 
--                        al ef ei eo ip li lt op_s  rn sd s_in   s_ou   wr z 
--         CONTROL_WORD := "000001000110000110000001111110101110" ; 
--                        al ef ei eo ip li lt op_s  rn sd s_in   s_ou   wr z 
    when "00010" => 
      CASE INTR_WORD is 
       when "00001" => 
         CONTROL_WORD := "000000001110000000000011111110101110" ; 
       when others => 
         CONTROL_WORD := "000001000110000000000001111110101110" ; 
      end CASE ; 
--         CONTROL_WORD := "000001000110000010000001111110101110" ; 
--                        al ef ei eo ip li lt op_s  rn sd s_in   s_ou   wr z 
----------------------------------------------------------------- 
    when "00011" =>   -- 4th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is 
		 when "11010011" => -- OUT (D3h)
			CONTROL_WORD := "000001000110000000000011111110101110" ;
			
       when  "01111111" => --  mov a,a 
         CONTROL_WORD := "000001000110010000000011001110011111" ; 
--                        aeeeili lt op_s  rn sd s_in   s_ou   wr z 
--                        lfiopi o  p  i 
       when  "01111000" => --  mov a,b 
         CONTROL_WORD := "000001000110010000000011001110000011" ; 

       when  "01111001" => --  mov a,c 
         CONTROL_WORD := "000001000110010000000011001110000111" ; 

       when  "01111010" => --  mov a,d 
         CONTROL_WORD := "000001000110010000000011001110001011" ; 

       when  "01111011" => --  mov a,e 
         CONTROL_WORD := "000001000110010000000011001110001111" ; 

       when  "01111100" => --  mov a,h 
         CONTROL_WORD := "000001000110010000000011001110010011" ; 

       when  "01111101" => --  mov a,l 
         CONTROL_WORD := "000001000110010000000011001110010111" ; 

       when  "01000111" => --  mov b,a 
         CONTROL_WORD := "000001000110010000000011000000011111" ; 

       when  "01000000" => --  mov b,b 
         CONTROL_WORD := "000001000110010000000011000000000011" ; 

       when  "01000001" => --  mov b,c 
         CONTROL_WORD := "000001000110010000000011000000000111" ; 

       when  "01000010" => --  mov b,d 
         CONTROL_WORD := "000001000110010000000011000000001011" ; 

       when  "01000011" => --  mov b,e 
         CONTROL_WORD := "000001000110010000000011000000001111" ; 

       when  "01000100" => --  mov b,h 
         CONTROL_WORD := "000001000110010000000011000000010011" ; 

       when  "01000101" => --  mov b,l 
         CONTROL_WORD := "000001000110010000000011000000010111" ; 

       when  "01001111" => --  mov c,a 
         CONTROL_WORD := "000001000110010000000011000010011111" ; 

       when  "01001000" => --  mov c,b 
         CONTROL_WORD := "000001000110010000000011000010000011" ; 

       when  "01001001" => --  mov c,c 
         CONTROL_WORD := "000001000110010000000011000010000111" ; 

       when  "01001010" => --  mov c,d 
         CONTROL_WORD := "000001000110010000000011000010001011" ; 

       when  "01001011" => --  mov c,e 
         CONTROL_WORD := "000001000110010000000011000010001111" ; 

       when  "01001100" => --  mov c,h 
         CONTROL_WORD := "000001000110010000000011000010010011" ; 

       when  "01001101" => --  mov c,l 
         CONTROL_WORD := "000001000110010000000011000010010111" ; 

       when  "01010111" => --  mov d,a 
         CONTROL_WORD := "000001000110010000000011000100011111" ; 

       when  "01010000" => --  mov d,b 
         CONTROL_WORD := "000001000110010000000011000100000011" ; 

       when  "01010001" => --  mov d,c 
         CONTROL_WORD := "000001000110010000000011000100000111" ; 

       when  "01010010" => --  mov d,d 
         CONTROL_WORD := "000001000110010000000011000100001011" ; 

       when  "01010011" => --  mov d,e 
         CONTROL_WORD := "000001000110010000000011000100001111" ; 

       when  "01010100" => --  mov d,h 
         CONTROL_WORD := "000001000110010000000011000100010011" ; 

       when  "01010101" => --  mov d,l 
         CONTROL_WORD := "000001000110010000000011000100010111" ; 

       when  "01011111" => --  mov e,a 
         CONTROL_WORD := "000001000110010000000011000110011111" ; 

       when  "01011000" => --  mov e,b 
         CONTROL_WORD := "000001000110010000000011000110000011" ; 

       when  "01011001" => --  mov e,c 
         CONTROL_WORD := "000001000110010000000011000110000111" ; 

       when  "01011010" => --  mov e,d 
         CONTROL_WORD := "000001000110010000000011000110001011" ; 

       when  "01011011" => --  mov e,e 
         CONTROL_WORD := "000001000110010000000011000110001111" ; 

       when  "01011100" => --  mov e,h 
         CONTROL_WORD := "000001000110010000000011000110010011" ; 

       when  "01011101" => --  mov e,l 
         CONTROL_WORD := "000001000110010000000011000110010111" ; 

       when  "01100111" => --  mov h,a 
         CONTROL_WORD := "000001000110010000000011001000011111" ; 

       when  "01100000" => --  mov h,b 
         CONTROL_WORD := "000001000110010000000011001000000011" ; 

       when  "01100001" => --  mov h,c 
         CONTROL_WORD := "000001000110010000000011001000000111" ; 

       when  "01100010" => --  mov h,d 
         CONTROL_WORD := "000001000110010000000011001000001011" ; 

       when  "01100011" => --  mov h,e 
         CONTROL_WORD := "000001000110010000000011001000001111" ; 

       when  "01100100" => --  mov h,h 
         CONTROL_WORD := "000001000110010000000011001000010011" ; 

       when  "01100101" => --  mov h,l 
         CONTROL_WORD := "000001000110010000000011001000010111" ; 

       when  "01101111" => --  mov l,a 
         CONTROL_WORD := "000001000110010000000011001010011111" ; 

       when  "01101000" => --  mov l,b 
         CONTROL_WORD := "000001000110010000000011001010000011" ; 

       when  "01101001" => --  mov l,c 
         CONTROL_WORD := "000001000110010000000011001010000111" ; 

       when  "01101010" => --  mov l,d 
         CONTROL_WORD := "000001000110010000000011001010001011" ; 

       when  "01101011" => --  mov l,e 
         CONTROL_WORD := "000001000110010000000011001010001111" ; 

       when  "01101100" => --  mov l,h 
         CONTROL_WORD := "000001000110010000000011001010010011" ; 

       when  "01101101" => --  mov l,l 
         CONTROL_WORD := "000001000110010000000011001010010111" ; 

       when  "00111110" => --  MVI A 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 

       when  "00000110" => --  MVI B 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 

       when  "00001110" => --  MVI C 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 

       when  "00010110" => --  MVI D 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 

       when  "00011110" => --  MVI E 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 

       when  "00100110" => --  MVI H 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 

       when  "00101110" => --  MVI L 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 

       when  "01110111" => --  MOV M,A 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 
			
		 when  "11000011" => --  JMP A16 
         CONTROL_WORD := "000001000110010000000011001110000010" ;

       when  "11011010" => --  JC 
      if (CY = '1') then 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 
      elsif (CY = '0') then 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 
      end if ; 

       when  "11111010" => --  JM Jump on minus 
      if (SIGN = '1') then 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 
      elsif (SIGN = '0') then 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 
      end if ; 

       when  "11101010" => --  JPE 
      if (PARITY = '1') then 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 
      elsif (PARITY = '0') then 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 
      end if ; 

       when  "11001010" => --  JZ 
      if (ZERO = '1') then 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 
      elsif (ZERO = '0') then 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 
      end if ; 

       when  "11000010" => --  JNZ 
      if (ZERO = '0') then 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 
      elsif (ZERO = '1') then 
         CONTROL_WORD := "000001000110000000000011111110101110" ; 
      end if ; 

       when  "11001101" => --  CALL 
         CONTROL_WORD := "000001000110000000000011010101111110" ; 

       when  "11001001" => --  RET 
         CONTROL_WORD := "100001000110000000000011111111111110" ; 

--       when  "11001001" => --  RST0 
 --        CONTROL_WORD := "100001000110000000000011111111111110" ; 
  

----------------------------------------------------------------- 
-- ARITHMATIC/LOGIC OPERATIONS FOLLOWS 
----------------------------------------------------------------- 
       when  "00111101" => --  DCR A 
         CONTROL_WORD := "000001110110010001101010001110011111" ; 

       when  "00000101" => --  DCR B 
         CONTROL_WORD := "000001110110010001101010000000000011" ; 

       when  "00001101" => --  DCR C 
         CONTROL_WORD := "000001110110010001101010000010000111" ; 

       when  "00010101" => --  DCR D 
         CONTROL_WORD := "000001110110010001101010000100001011" ; 

       when  "00011101" => --  DCR E 
         CONTROL_WORD := "000001110110010001101010000110001111" ; 

       when  "00100101" => --  DCR H 
         CONTROL_WORD := "000001110110010001101010001000010011" ; 

       when  "00101101" => --  DCR L 
         CONTROL_WORD := "000001110110010001101010001010010111" ; 

       when  "00111100" => --  INR A 
         CONTROL_WORD := "000001110110010001100110001110011111" ; 

       when  "00000100" => --  INR B 
         CONTROL_WORD := "000001110110010001100110000000000011" ; 

       when  "00001100" => --  INR C 
         CONTROL_WORD := "000001110110010001100110000010000111" ; 

       when  "00010100" => --  INR D 
         CONTROL_WORD := "000001110110010001100110000100001011" ; 

       when  "00011100" => --  INR E 
         CONTROL_WORD := "000001110110010001100110000110001111" ; 

       when  "00100100" => --  INR H 
         CONTROL_WORD := "000001110110010001100110001000010011" ; 

       when  "00101100" => --  INR L 
         CONTROL_WORD := "000001110110010001100110001010010111" ; 

       when  "10010111" => --  SUB A 
         CONTROL_WORD := "000001110110010001011110001110011111" ; 

       when  "10010000" => --  SUB B 
         CONTROL_WORD := "000001110110010001011110001110000011" ; 

       when  "10010001" => --  SUB C 
         CONTROL_WORD := "000001110110010001011110001110000111" ; 

       when  "10010010" => --  SUB D 
         CONTROL_WORD := "000001110110010001011110001110001011" ; 

       when  "10010011" => --  SUB E 
         CONTROL_WORD := "000001110110010001011110001110001111" ; 

       when  "10010100" => --  SUB H 
         CONTROL_WORD := "000001110110010001011110001110010011" ; 

       when  "10010101" => --  SUB L 
         CONTROL_WORD := "000001110110010001011110001110010111" ; 

       when  "10000111" => --  ADD A 
        CONTROL_WORD := "000001100110010001000010001110011111" ; 

       when  "10000000" => --  ADD B 
        CONTROL_WORD := "000001100110010001000010001110000011" ; 

       when  "10000001" => --  ADD C 
        CONTROL_WORD := "000001100110010001000010001110000111" ; 

       when  "10000010" => --  ADD D 
        CONTROL_WORD := "000001100110010001000010001110001011" ; 

       when  "10000011" => --  ADD E 
        CONTROL_WORD := "000001100110010001000010001110001111" ; 

       when  "10000100" => --  ADD H 
        CONTROL_WORD := "000001100110010001000010001110010011" ; 

       when  "10000101" => --  ADD L 
        CONTROL_WORD := "000001100110010001000010001110010111" ; 

       when  "10110111" => --  ORA A 
        CONTROL_WORD := "000001100110010001010110001110011111" ; 

       when  "10110000" => --  ORA B 
        CONTROL_WORD := "000001100110010001010110001110000011" ; 

       when  "10110001" => --  ORA C 
        CONTROL_WORD := "000001100110010001010110001110000111" ; 

       when  "10110010" => --  ORA D 
        CONTROL_WORD := "000001100110010001010110001110001011" ; 

       when  "10110011" => --  ORA E 
        CONTROL_WORD := "000001100110010001010110001110001111" ; 

       when  "10110100" => --  ORA H 
        CONTROL_WORD := "000001100110010001010110001110010011" ; 

       when  "10110101" => --  ORA L 
        CONTROL_WORD := "000001100110010001010110001110010111" ; 

       when  "10101111" => --  XRA A 
        CONTROL_WORD := "000001100110010001000110001110011111" ; 

       when  "10101000" => --  XRA B 
        CONTROL_WORD := "000001100110010001000110001110000011" ; 

       when  "10101001" => --  XRA C 
        CONTROL_WORD := "000001100110010001000110001110000111" ; 

       when  "10101010" => --  XRA D 
        CONTROL_WORD := "000001100110010001000110001110001011" ; 

       when  "10101011" => --  XRA E 
        CONTROL_WORD := "000001100110010001000110001110001111" ; 

       when  "10101100" => --  XRA H 
        CONTROL_WORD := "000001100110010001000110001110010011" ; 

       when  "10101101" => --  XRA L 
        CONTROL_WORD := "000001100110010001000110001110010111" ; 

       when  "10100111" => --  ANA A 
        CONTROL_WORD := "000001100110010001001111111110011111" ; 

       when  "10100000" => --  ANA B 
        CONTROL_WORD := "000001100110010001001111111110000011" ; 

       when  "10100001" => --  ANA C 
        CONTROL_WORD := "000001100110010001001111111110000111" ; 

       when  "10100010" => --  ANA D 
        CONTROL_WORD := "000001100110010001001111111110001011" ; 

       when  "10100011" => --  ANA E 
        CONTROL_WORD := "000001100110010001001111111110001111" ; 

       when  "10100100" => --  ANA H 
        CONTROL_WORD := "000001100110010001001111111110010011" ; 

       when  "10100101" => --  ANA L 
        CONTROL_WORD := "000001100110010001001111111110010111" ; 
		 when  "00000000" => --  NOP --BEN EKLEDİM
        CONTROL_WORD := "000001000110010000000011001110011111" ; 
    when others => 
        CONTROL_WORD := "000001000000000000000010111111111110" ; 
    end case ; 

----------------------------------------------------------------- 
    when "00100" =>   -- 5th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is 
		 when "11010011" => -- OUT (port byte read)
		  CONTROL_WORD := "010001000101001100000011111110101110" ;
		  
       when  "00111110" => --  MVI A 
        CONTROL_WORD := "010001000101001100000011111110101110" ; 

       when  "00000110" => --  MVI B 
        CONTROL_WORD := "010001000101001100000011111110101110" ; 

       when  "00001110" => --  MVI C 
        CONTROL_WORD := "010001000101001100000011111110101110" ; 

       when  "00010110" => --  MVI D 
        CONTROL_WORD := "010001000101001100000011111110101110" ; 

       when  "00011110" => --  MVI E 
        CONTROL_WORD := "010001000101001100000011111110101110" ; 

       when  "00100110" => --  MVI H 
        CONTROL_WORD := "010001000101001100000011111110101110" ; 

       when  "00101110" => --  MVI L 
        CONTROL_WORD := "010001000101001100000011111110101110" ; 

       when  "01110111" => --  MOV M,A 
        CONTROL_WORD := "010111000101001000000011111110010110" ; 
		  
		 when  "11000011" => --  JMP A16 
         CONTROL_WORD := "010001000101001100000011111110101110" ;

       when  "11011010" => --  JC 
      if (CY = '1') then 
        CONTROL_WORD := "010001000101001100000011111110101110" ; 
      elsif (CY = '0') then 
        CONTROL_WORD := "001001000110000100000011111110010110" ; 
      end if ; 

       when  "11111010" => --  JM 
      if (SIGN = '1') then 
        CONTROL_WORD := "010001000101001100000011111110101110" ; 
      elsif (SIGN = '0') then 
        CONTROL_WORD := "001001000110000100000011111110010110" ; 
      end if ; 

       when  "11101010" => --  JPE 
      if (PARITY = '1') then 
        CONTROL_WORD := "010001000101001100000011111110101110" ; 
      elsif (PARITY = '0') then 
        CONTROL_WORD := "001001000110000100000011111110010110" ; 
      end if ; 

       when  "11001010" => --  JZ 
      if (ZERO = '1') then 
        CONTROL_WORD := "010001000101001100000011111110101110" ; 
      elsif (ZERO = '0') then 
        CONTROL_WORD := "001001000110000100000011111110010110" ; 
      end if ; 

       when  "11000010" => --  JNZ 
      if (ZERO = '0') then 
        CONTROL_WORD := "010001000101001100000011111110101110" ; 
      elsif (ZERO = '1') then 
        CONTROL_WORD := "001001000110000100000011111110010110" ; 
      end if ; 

       when  "11001101" => --  CALL 
         CONTROL_WORD := "000001000110000000000011111111111110" ; 
  
  

    when others => 
        CONTROL_WORD := "000001000000000000000010111111111110" ; 
    end case ; 

----------------------------------------------------------------- 
    when "00101" =>  -- 6th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is
		when "11010011" => -- OUT (write cycle - 1)
		  CONTROL_WORD := "000001000100100000000001011010101110" ;	 
		  
       when  "00111110" => --  MVI A 
        CONTROL_WORD := "000001000100100000000001001111111110" ; 

       when  "00000110" => --  MVI B 
        CONTROL_WORD := "000001000100100000000001000001111110" ; 

       when  "00001110" => --  MVI C 
        CONTROL_WORD := "000001000100100000000001000011111110" ; 

       when  "00010110" => --  MVI D 
        CONTROL_WORD := "000001000100100000000001000101111110" ; 

       when  "00011110" => --  MVI E 
        CONTROL_WORD := "000001000100100000000001000111111110" ; 

       when  "00100110" => --  MVI H 
        CONTROL_WORD := "000001000100100000000001001001111110" ; 

       when  "00101110" => --  MVI L 
        CONTROL_WORD := "000001000100100000000001001011111110" ; 

       when  "01110111" => --  MOV M,A 
        CONTROL_WORD := "000111000100001000000011111110011100" ; 
		  
		 when  "11000011" => --  JMP A16 
         CONTROL_WORD := "000001000100100000000001011010101110" ;
  

       when  "11011010" => --  JC 
      if (CY = '1') then 
        CONTROL_WORD := "010001000100100000000001010110101110" ; 
      elsif (CY = '0') then 
        CONTROL_WORD := "000001000110000100000011111110010110" ; 
      end if ; 

       when  "11111010" => --  JM 
      if (SIGN = '1') then 
        CONTROL_WORD := "010001000100100000000001010110101110" ; 
      elsif (SIGN = '0') then 
        CONTROL_WORD := "000001000110000100000011111110010110" ; 
      end if ; 

       when  "11101010" => --  JPE 
      if (PARITY = '1') then 
        CONTROL_WORD := "010001000100100000000001010110101110" ; 
      elsif (PARITY = '0') then 
        CONTROL_WORD := "000001000110000100000011111110010110" ; 
      end if ; 

       when  "11001010" => --  JZ 
      if (ZERO = '1') then 
        CONTROL_WORD := "010001000100100000000001010110101110" ; 
      elsif (ZERO = '0') then 
        CONTROL_WORD := "000001000110000100000011111110010110" ; 
      end if ; 

       when  "11000010" => --  JNZ 
      if (ZERO = '0') then 
        CONTROL_WORD := "010001000100100000000001010110101110" ; 
      elsif (ZERO = '1') then 
        CONTROL_WORD := "000001000110000100000011111110010110" ; 
      end if ; 

       when  "11001101" => --  CALL 
         CONTROL_WORD := "000001000110000000000011010101111110" ; 
  
  

    when others => 
        CONTROL_WORD := "000001000000000000000010111111111110" ; 
    end case ; 
  

----------------------------------------------------------------- 
    when "00110" =>  -- 7th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is 
		 when "11010011" => -- OUT 
		  CONTROL_WORD := "000001000100100000000011111110101110" ;
		  
       when  "00111110" => --  MVI A 
        CONTROL_WORD := "000001000100100000000001001111111111" ; 

       when  "00000110" => --  MVI B 
        CONTROL_WORD := "000001000100100000000001000001111111" ; 

       when  "00001110" => --  MVI C 
        CONTROL_WORD := "000001000100100000000001000011111111" ; 

       when  "00010110" => --  MVI D 
        CONTROL_WORD := "000001000100100000000001000101111111" ; 

       when  "00011110" => --  MVI E 
        CONTROL_WORD := "000001000100100000000001000111111111" ; 

       when  "00100110" => --  MVI H 
        CONTROL_WORD := "000001000100100000000001001001111111" ; 

       when  "00101110" => --  MVI L 
        CONTROL_WORD := "000001000100100000000001001011111111" ; 

       when  "01110111" => --  MOV M,A 
        CONTROL_WORD := "000111000100001000000011111110011101" ; 
		  
		 when  "11000011" => --  JMP A16 
         CONTROL_WORD := "000001000100100000000011111110101110" ;
  

       when  "11011010" => --  JC 
      if (CY = '1') then 
        CONTROL_WORD := "000001000100100000000001010110101110" ; 
      elsif (CY = '0') then 
        CONTROL_WORD := "000001000110000000000011111110010111" ; 
      end if ; 

       when  "11111010" => --  JM 
      if (SIGN = '1') then 
        CONTROL_WORD := "000001000100100000000001010110101110" ; 
      elsif (SIGN = '0') then 
        CONTROL_WORD := "000001000110000000000011111110010111" ; 
      end if ; 

       when  "11101010" => --  JPE 
      if (PARITY = '1') then 
        CONTROL_WORD := "000001000100100000000001010110101110" ; 
      elsif (PARITY = '0') then 
        CONTROL_WORD := "000001000110000000000011111110010111" ; 
      end if ; 

       when  "11001010" => --  JZ 
      if (ZERO = '1') then 
        CONTROL_WORD := "000001000100100000000001010110101110" ; 
      elsif (ZERO = '0') then 
        CONTROL_WORD := "000001000110000000000011111110010111" ; 
      end if ; 

       when  "11000010" => --  JNZ 
      if (ZERO = '0') then 
        CONTROL_WORD := "000001000100100000000001010110101110" ; 
      elsif (ZERO = '1') then 
        CONTROL_WORD := "000001000110000000000011111110010111" ; 
      end if ; 

       when  "11001101" => --  CALL 
         CONTROL_WORD := "010001000111001000000011111110101110" ; 
  

    when others => 
        CONTROL_WORD := "000001000000000000000010111111111110" ; 
----                        al ef ei eo ip li lt op_s  rn sd s_in   s_ou   wr z 
--         CONTROL_WORD := "000001000000  0  0  0  0  0  0  0000  0  0  00000  00000  0  0" ; 
----                        0  1  2  3  4  5  6  7-10  11 12 13-17  19-22  23 24 
----                        24 23 22 21 20 19 18 1714  13 12 11-07  06-02   1  0 
----------------------------------------------------------------- 
    end case ; 

----------------------------------------------------------------- 
    when "00111" =>  -- 8th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is 
	  when "11010011" => -- OUT 
		  CONTROL_WORD := "010001001011001000000011111110110110" ;
		  
		 when  "11000011" => --  JMP A16 
         CONTROL_WORD := "010001000101001100000011111110101110" ;
			
       when  "11011010" => --  JC 
        CONTROL_WORD := "000001000101001000000011111110101110" ; 

       when  "11111010" => --  JM 
        CONTROL_WORD := "000001000101001000000011111110101110" ; 

       when  "11101010" => --  JPE 
        CONTROL_WORD := "000001000101001000000011111110101110" ; 

       when  "11001010" => --  JZ 
        CONTROL_WORD := "000001000101001000000011111110101110" ; 

       when  "11000010" => --  JNZ 
        CONTROL_WORD := "000001000101001000000011111110101110" ; 

       when  "11001101" => --  CALL 
         CONTROL_WORD := "000001000110100100000001001101111110" ; 

    when others => 
        CONTROL_WORD := "000001000000000000000010111111111110" ; 
    end case ; 

----------------------------------------------------------------- 
    when "01000" =>  -- 9th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is 
	 	  when "11010011" => -- OUT 
		  CONTROL_WORD := "000001001010001000000011111110011100" ;
		  
		 when  "11000011" => --  JMP A16 
         CONTROL_WORD := "000001000100100000000001001100101110" ;
			
       when  "11011010" => --  JC 
        CONTROL_WORD := "000001000100100000000001011000101110" ; 

       when  "11111010" => --  JM 
        CONTROL_WORD := "000001000100100000000001011000101110" ; 

       when  "11101010" => --  JPE 
        CONTROL_WORD := "000001000100100000000001011000101110" ; 

       when  "11001010" => --  JZ 
        CONTROL_WORD := "000001000100100000000001011000101110" ; 

       when  "11000010" => --  JNZ 
        CONTROL_WORD := "000001000100100000000001011000101110" ; 

       when  "11001101" => --  CALL 
         CONTROL_WORD := "000001000110100000000001001101111110" ; 

    when others => 
        CONTROL_WORD := "000001000000000000000010111111111110" ; 
    end case ; 

----------------------------------------------------------------- 
    when "01001" =>  -- 10th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is 
	 when "11010011" => -- OUT D3
            -- iomn=1, s1=0, s0=1. WRn=1. Tüm sinyaller inaktif.
            -- ZERO_SEQ_COUNTER=1 (0) (Sekans sayacını sıfırla, komut bitişi)
            CONTROL_WORD := "000001001010001000000011111110101111" ;
				
		 when  "11000011" => --  JMP A16 
         CONTROL_WORD := "000001000100100000000011111110101110" ;
			
       when  "11011010" => --  JC 
        CONTROL_WORD := "000000101001000000000000000000000011" ; 

       when  "11111010" => --  JM 
        CONTROL_WORD := "000001000100000000000001111111111111" ; 

       when  "11101010" => --  JPE 
        CONTROL_WORD := "000001000100000000000001111111111111" ; 

       when  "11001010" => --  JZ 
        CONTROL_WORD := "000001000100000000000001111111111111" ; 

       when  "11000010" => --  JNZ 
        CONTROL_WORD := "000001000100000000000001111111111111" ; 

       when  "11001101" => --  CALL 
         CONTROL_WORD := "010001000111001000000011111110101110" ; 

    when others => 
        CONTROL_WORD := "000001000000000000000010111111111110" ; 
    end case ; 

----------------------------------------------------------------- 
    when "01010" =>  -- 11th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is 
       when  "11001101" => --  CALL 
         CONTROL_WORD := "000001000110100100000001011010101110" ; 
		 when  "11000011" => --  JMP A16 
         CONTROL_WORD := "000001000110010000000011010110110110" ;
    when others => 
        CONTROL_WORD := "000001000000000000000010111111111110" ; 
    end case ; 

----------------------------------------------------------------- 
    when "01011" =>  -- 12th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is 
       when  "11001101" => --  CALL 
         CONTROL_WORD := "001001000110100000000001011010101110" ; 
		 when  "11000011" => --  JMP A16 
         CONTROL_WORD := "000001000110010000000011011000011011" ;

    when others => 
        CONTROL_WORD := "000001000000000000000010111111111110" ; 
    end case ; 

----------------------------------------------------------------- 
    when "01100" =>  -- 13th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is 
       when  "11001101" => --  CALL 
         CONTROL_WORD := "011001000111001000000011010100100110" ; 

    when others => 
        CONTROL_WORD := "000001000000000000000010111111111110" ; 
    end case ; 

----------------------------------------------------------------- 
    when "01101" =>  -- 14th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is 
       when  "11001101" => --  CALL 
         CONTROL_WORD := "011001000110001000000011111110110000" ; 

    when others => 
        CONTROL_WORD := "010001000000000000000010111111111110" ; 
    end case ; 

----------------------------------------------------------------- 
    when "01110" =>  -- 15th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is 
       when  "11001101" => --  CALL 
         CONTROL_WORD := "001001000110001000000011111110110000" ; 

    when others => 
        CONTROL_WORD := "000001000000000000000010111111111110" ; 
    end case ; 

----------------------------------------------------------------- 
    when "01111" =>  -- 16th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is 
       when  "11001101" => --  CALL 
         CONTROL_WORD := "011001000111001000000011111110100110" ; 

    when others => 
        CONTROL_WORD := "010001000110100000000011111110110000" ; 
    end case ; 

----------------------------------------------------------------- 
    when "10000" =>  -- 17th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is 
       when  "11001101" => --  CALL 
         CONTROL_WORD := "011001000110001000000011111110101100" ; 

    when others => 
        CONTROL_WORD := "000001000000000000000010111111111110" ; 
    end case ; 

----------------------------------------------------------------- 
    when "10001" =>  -- 18th T STATE 
----------------------------------------------------------------- 
    case ID_OUT_S is 
       when  "11001101" => --  CALL 
         CONTROL_WORD := "001001000110011000000011011000110101" ; 

    when others => 
        CONTROL_WORD := "000001000000000000000010111111111110" ; 
    end case ; 

 when others => 
        CONTROL_WORD := "000001000000000000000010111111111111" ; 
 end case ; 
  

DCR_SP              <= CONTROL_WORD(35) ; 
LATCH_LOW_ADD       <= CONTROL_WORD(34) ; 
for i in 33 downto 31 loop 
SEL_HI_ADD(i-31)        <= CONTROL_WORD(i) ; 
end loop ; 

INTA                <= CONTROL_WORD(30) ; 
LOAD_FL             <= CONTROL_WORD(29) ; 
CIN                 <= CONTROL_WORD(28) ; 
iomn                <= CONTROL_WORD(27) ; 
s1                  <= CONTROL_WORD(26) ; 
s0                  <= CONTROL_WORD(25) ; 
ALE                 <= CONTROL_WORD(24) ; 
EN_FROM_OUT         <= CONTROL_WORD(23) ; 
EN_IN_BUS           <= CONTROL_WORD(22) ; 
EN_OUT_BUS          <= CONTROL_WORD(21) ; 
INR_PC              <= CONTROL_WORD(20) ; 
LOAD_REG_ID         <= CONTROL_WORD(19) ; 
LOAD_REG_T          <= CONTROL_WORD(18) ; 

for i in 17 downto 14 loop 
 OP_SEL(i-14)        <= CONTROL_WORD(i) ; 
end loop ; 

RDn                 <= CONTROL_WORD(13) ; 
SEL_DATAOUT_ALU_OUT <= CONTROL_WORD(12) ; 

for i in 11 downto 7 loop 
 SEL_IN(i-7)        <= CONTROL_WORD(i) ; 
end loop ; 

for i in 6 downto 2 loop 
 SEL_OUT(i-2)        <= CONTROL_WORD(i) ; 
end loop ; 

WRn                 <= CONTROL_WORD(1) ; 
ZERO_SEQ_COUNTER    <= CONTROL_WORD(0) ; 
end process ; 
end behav ; 
------------------------------------------------------------ 
--DESIGN cpu_control ENDS here 
------------------------------------------------------------ 
  
  
  
  
  
  

------------------------------------------------------------ 
--DESIGN cpu_8085 BEGINS here 
------------------------------------------------------------ 
LIBRARY IEEE; 
use ieee.std_logic_1164.all; 

entity cpu_8085 is 
  port(data_bus   : inout std_logic_vector(7 downto 0) ; 
       add_bus    : out std_logic_vector(7 downto 0) ; 
       cpu_reset  :in std_logic ; 
       s0         : out std_logic ; 
       s1         : out std_logic ; 
       iomn       : out std_logic ; 
       ALE        : out std_logic ; 
       RESETOUT   : out std_logic ; 
       CLK_OUT    : out std_logic ; 
       clk        : in std_logic ; 
       X1         : in std_logic ; 
       X2         : in std_logic ; 
       SOD        : in std_logic ; 
       SID        : in std_logic ; 
       HOLD       : in std_logic ; 
       HOLDA      : out std_logic ;
       TRAP       : in std_logic ; 
       RST7_5     : in std_logic ; 
       RST6_5     : in std_logic ; 
       RST5_5     : in std_logic ; 
       INTR       : in std_logic ; 
       INTA       : out std_logic ; 
       READY      : in std_logic ; 
       RDn        : out std_logic ; 
       WRn        : out std_logic ;
		 cnm : out std_logic
      ) ; 
end cpu_8085 ; 

architecture behav of cpu_8085 is 
signal LOAD_LOW_ADD   : std_logic ;  --cw item 
signal EN_IN_BUS      : std_logic ;  --cw item 
signal EN_OUT_BUS     : std_logic ;  --cw item 
signal EN_FROM_OUT    : std_logic ;  --cw item 
signal SEL_DATAOUT_ALU_OUT  : std_logic ;  --cw item 
signal T_STATES       : std_logic_vector(4 downto 0);-- := "11111";  --cw item 
signal logic_one      : std_logic ;    --:= '1';  --cw item 
signal ZERO_SEQ_COUNTER: std_logic ;  --cw item 
signal LOAD_REG_T     : std_logic ;  --cw item 
signal LOAD_REG_ID    : std_logic ;  --cw item 
signal INR_PC         : std_logic ;  --cw item 
signal DCR_SP         : std_logic ;  --cw item 
signal OP_SEL         : std_logic_vector(3 downto 0) ;  --cw item 
signal LOW_ADD        : std_logic_vector(7 downto 0) ; 
signal INSIDE_BUS     : std_logic_vector(7 downto 0) ; 
signal IN_BUS_RES     : std_logic_vector(7 downto 0) ; 
signal A_OUT_S        : std_logic_vector(7 downto 0) ; 
signal B_OUT_S        : std_logic_vector(7 downto 0) ; 
signal C_OUT_S        : std_logic_vector(7 downto 0) ; 
signal D_OUT_S        : std_logic_vector(7 downto 0) ; 
signal E_OUT_S        : std_logic_vector(7 downto 0) ; 
signal F_OUT_S        : std_logic_vector(7 downto 0) ; 
signal H_OUT_S        : std_logic_vector(7 downto 0) ; 
signal L_OUT_S        : std_logic_vector(7 downto 0) ; 
signal T_OUT_S        : std_logic_vector(7 downto 0) ; 
signal SPH_OUT_S      : std_logic_vector(7 downto 0) ; 
signal ID_OUT_S       : std_logic_vector(7 downto 0) ; 
signal SEL_IN         : std_logic_vector(4 downto 0) ; 
signal SEL_OUT        : std_logic_vector(4 downto 0) ; 
signal CY_S           : std_logic; 
signal ACY_S          : std_logic; 
signal SIGN_S         : std_logic; 
signal PARITY_S       : std_logic; 
signal ZERO_S         : std_logic; 
signal CIN_S          : std_logic; 
signal DAT_IN_FL_S     : std_logic_vector(7 downto 0); 
signal LOAD_FL_S       : std_logic; 
signal ADD_HIGH_S      : std_logic_vector(7 downto 0); 
signal SEL_S           : std_logic_vector(2 downto 0); 
signal clkn            : std_logic; 
signal REG_ARR_OUT_BUS : std_logic_vector(7 downto 0 ); 
signal ALU_BUS         : std_logic_vector(7 downto 0 ); 

component trans_latch 

   port( in_dat  : in std_logic_vector (7 downto 0); 
         load    : in std_logic; 
         dat_out : out std_logic_vector (7 downto 0);
			clk : in std_Logic ); 

end component; 

component  add_latch_high
       generic (n: integer:= 7); 
 port(dat_pch : in std_logic_vector(7 downto 0) ; 
      dat_H   : in std_logic_vector(7 downto 0) ; 
      dat_B   : in std_logic_vector(7 downto 0) ; 
      dat_D   : in std_logic_vector(7 downto 0) ; 
      dat_SPH : in std_logic_vector(7 downto 0) ; 
      SEL     : in std_logic_vector(2 downto 0) ; 
      clk     : in std_logic ; 
      clrn    : in std_logic ; 
      load    : in std_logic ; 
      data_out   : out std_logic_vector(7 downto 0) ); 
end component ; 

component MUX2X1_VEC 
   port( dat_out : out std_logic_vector(7 downto 0); 
         EN : in std_logic; 
         dat_in_b : in std_logic_vector(7 downto 0); 
         data_in : in std_logic_vector(7 downto 0)); 

end component; 

component cpu_control 
    port( 
        ID_OUT_S     : in std_logic_vector(7 downto 0) ; 
        DEC5X32_IN     : in std_logic_vector(4 downto 0) ; 
        clk                  : in std_logic ; 

       s0         : out std_logic ; 
       s1         : out std_logic ; 
       iomn       : out std_logic ; 
       RESETOUT   : out std_logic ; 
       CLK_OUT    : out std_logic ; 
       SOD        : in std_logic ; 
       SID        : in std_logic ; 
       HOLD       : in std_logic ; 
       HOLDA      : out std_logic ; 
       TRAP       : in std_logic ; 
       RST7_5     : in std_logic ; 
       RST6_5     : in std_logic ; 
       RST5_5     : in std_logic ; 
       INTR       : in std_logic ; 
       INTA       : out std_logic ; 
       ACY        : in std_logic ; 
       SIGN       : in std_logic ; 
       PARITY     : in std_logic ; 
       ZERO       : in std_logic ; 
       CY         : in std_logic ; 
       CIN        : out std_logic ; 
       LOAD_FL    : out std_logic ; 
       SEL_HI_ADD : out std_logic_vector(2 downto 0 ) ; 

        LATCH_LOW_ADD          : out std_logic ; 
        ZERO_SEQ_COUNTER     : out std_logic ; 
        ALE     : out std_logic ; 
        RDn     : out std_logic ; 
        WRn     : out std_logic ; 
        OP_SEL : out std_logic_vector(3 downto 0) ; 
        SEL_DATAOUT_ALU_OUT     : out std_logic ; 
        EN_FROM_OUT     : out std_logic ; 
       LOAD_REG_T     : out std_logic ; 
       LOAD_REG_ID     : out std_logic ; 
       INR_PC     : out std_logic ; 
       DCR_SP     : out std_logic ; 
       EN_OUT_BUS     : out std_logic ; 
       EN_IN_BUS     : out std_logic ; 
       clkn                   : out std_logic ; 
       SEL_IN    : out std_logic_vector(4 downto 0) ; 
       SEL_OUT   : out std_logic_vector(4 downto 0)) ; 
end component ; 

component TRI_ARR 
   port( data_out : out std_logic_vector(7 downto 0) ; 
         EN : in std_ulogic; 
         data_in : in std_logic_vector(7 downto 0)); 

end component; 

component alu 
      generic ( n : integer := 7 ; 
                s : integer := 3) ; 
      port(dat_a  : in std_logic_vector(n downto 0); 
           dat_b  : in std_logic_vector(n downto 0); 
           dat_out: out std_logic_vector(n downto 0); 
           cout   : out std_logic; 
           ACY   : out std_logic; 
           SIGN   : out std_logic; 
           PARITY   : out std_logic; 
           ZERO   : out std_logic; 
           CIN   : in std_logic; 
           op_sel : in std_logic_vector(s downto 0)); 
end component; 

component REG_ARR 
generic ( n : integer := 7 ; 
          s : integer := 4); 
port ( DAT_IN    : in std_logic_vector(n downto 0) ; 
       DAT_IN_FL : in std_logic_vector(n downto 0) ; 
       LOAD_FL   : in std_logic ; 
       clrn      : in std_logic ; 
       clk       : in std_logic ; 
       INR_PC    : in std_logic ; 
       DCR_SP    : in std_logic ; 
       DAT_OUT   : out std_logic_vector(n downto 0) ; 
       COUNT_OUT : out std_logic_vector(n downto 0) ; 
       A_OUT     : out std_logic_vector(n downto 0) ; 
       B_OUT     : out std_logic_vector(n downto 0) ; 
       C_OUT     : out std_logic_vector(n downto 0) ; 
       D_OUT     : out std_logic_vector(n downto 0) ; 
       E_OUT     : out std_logic_vector(n downto 0) ; 
       F_OUT     : out std_logic_vector(n downto 0) ; 
       H_OUT     : out std_logic_vector(n downto 0) ; 
       L_OUT     : out std_logic_vector(n downto 0) ; 
       SPH_OUT   : out std_logic_vector(n downto 0) ; 
       SEL_IN    : in std_logic_vector(s downto 0) ; 
       SEL_OUT   : in std_logic_vector(s downto 0)) ; 
end component ; 

component reg8 
       port(data_in    : in std_logic_vector(7 downto 0); 
            load       : in std_logic; 
            clrn       : in std_logic; 
            clk        : in std_logic; 
            data_out   : out std_logic_vector(7 downto 0)); 
end component ; 

component COUNTER05 
   generic ( s : integer := 4) ; 
   port ( clk : in std_logic ; 
          zero_en: in std_logic ; 
          c_en: in std_logic ; 
          clrn: in std_logic ; 
          C_OUT   : out std_logic_vector(s downto 0)); 
end component ; 

begin 
logic_one <= '1' ; 
LOW_ADD_LATCH: trans_latch port map 
         (in_dat  => IN_BUS_RES , 
         load     => LOAD_LOW_ADD, 
         dat_out  => LOW_ADD,
			clk => clk 
			); 

COUNTER_1 : COUNTER05 port map (clk => clk , 
                                zero_en => ZERO_SEQ_COUNTER, 
                                c_en => READY , 
                                clrn => cpu_reset , 
                                C_OUT => T_STATES); 
  

ADD_LATCH_1: add_latch_high port map (dat_pch => ADD_HIGH_S, 
      dat_H   => H_OUT_S , 
      dat_B   => B_OUT_S , 
      dat_D   => D_OUT_S , 
      dat_SPH => SPH_OUT_S , 
      SEL     => SEL_S , 
      clk     => clk , 
      clrn    => cpu_reset, 
      load    => logic_one , 
      data_out => add_bus) ; 

REG_T : reg8 port map (data_in => REG_ARR_OUT_BUS , 
            load       => LOAD_REG_T , 
            clrn       => cpu_reset, 
            clk        => clkn, 
            data_out   => T_OUT_S); 

REG_ID : reg8 port map (data_in => INSIDE_BUS , 
            load       => LOAD_REG_ID , 
            clrn       => cpu_reset, 
            clk        => clk, 
            data_out   => ID_OUT_S); 

ALU_1 : alu port map (dat_a   => A_OUT_S, 
           dat_b   => T_OUT_S, 
           dat_out => ALU_BUS, 
           cout    => CY_S, 
           ACY     => ACY_S, 
           SIGN    => SIGN_S, 
           PARITY  => PARITY_S, 
           ZERO    => ZERO_S, 
           CIN     => CIN_S, 
           op_sel  => OP_SEL); 

REGS_1 : REG_ARR 
       port map (DAT_IN    => INSIDE_BUS, 
       DAT_IN_FL => DAT_IN_FL_S , 
       LOAD_FL   => LOAD_FL_S, 
       clrn      => cpu_reset , 
       clk       => clk, 
       INR_PC    => INR_PC, 
       DCR_SP    => DCR_SP, 
       DAT_OUT   => REG_ARR_OUT_BUS, 
       COUNT_OUT   => ADD_HIGH_S, 
       A_OUT   => A_OUT_S, 
       B_OUT   => B_OUT_S, 
       C_OUT   => C_OUT_S, 
       D_OUT   => D_OUT_S, 
       E_OUT   => E_OUT_S, 
       F_OUT   => F_OUT_S, 
       H_OUT   => H_OUT_S, 
       L_OUT   => L_OUT_S, 
       SPH_OUT   => SPH_OUT_S, 
       SEL_IN    => SEL_IN, 
       SEL_OUT   => SEL_OUT); 

CONTROL_1 : cpu_control 
            port map ( 
        ID_OUT_S     => ID_OUT_S, 
        DEC5X32_IN   => T_STATES , 
        clk   =>   clk , 

       s0        =>  s0, 
       s1        =>  s1, 
       iomn      =>  iomn, 
       RESETOUT  =>  RESETOUT, 
       CLK_OUT   =>  CLK_OUT, 
       SOD       =>  SOD, 
       SID       =>  SID, 
       HOLD      =>  HOLD, 
       HOLDA     =>  HOLDA, 
       TRAP      =>  TRAP, 
       RST7_5    =>  RST7_5, 
       RST6_5    =>  RST6_5, 
       RST5_5    =>  RST5_5, 
       INTR      =>  INTR, 
       INTA      =>  INTA, 
       ACY       =>  F_OUT_S(4), 
       SIGN      =>  F_OUT_S(7), 
       PARITY    =>  F_OUT_S(2), 
       ZERO      =>  F_OUT_S(6), 
       CY        =>  F_OUT_S(0), 
       CIN       =>  CIN_S, 
       LOAD_FL   => LOAD_FL_S, 
       SEL_HI_ADD   => SEL_S, 

        LATCH_LOW_ADD    => LOAD_LOW_ADD, 
        ZERO_SEQ_COUNTER => ZERO_SEQ_COUNTER , 
        ALE => ALE, 
        RDn => RDn, 
        WRn => WRn, 
        OP_SEL => OP_SEL, 
        SEL_DATAOUT_ALU_OUT  => SEL_DATAOUT_ALU_OUT, 
        EN_FROM_OUT     => EN_FROM_OUT , 
       LOAD_REG_T   => LOAD_REG_T , 
       LOAD_REG_ID   => LOAD_REG_ID , 
       INR_PC   => INR_PC , 
       DCR_SP   => DCR_SP , 
       EN_OUT_BUS     => EN_OUT_BUS, 
       EN_IN_BUS     => EN_IN_BUS , 
       clkn => clkn , 
       SEL_IN    => SEL_IN , 
       SEL_OUT   => SEL_OUT); 

TRI_1 : TRI_ARR port map ( data_out => INSIDE_BUS , 
                           EN       => EN_IN_BUS, 
                           data_in  => IN_BUS_RES); 

TRI_2 : TRI_ARR port map ( data_out => data_bus , 
                           EN       => EN_OUT_BUS, 
                           data_in  => IN_BUS_RES); 
                           --data_in  => LOW_ADD); 

TRI_3 : TRI_ARR port map ( data_out => INSIDE_BUS , 
                           EN       => EN_FROM_OUT, 
                           data_in  => data_bus); 
MUX_SEL_1 : MUX2X1_VEC port map ( dat_out => IN_BUS_RES , 
                                  EN      => SEL_DATAOUT_ALU_OUT , 
                                  dat_in_b      => REG_ARR_OUT_BUS , 
                                  data_in      => ALU_BUS ); 

DAT_IN_FL_S(7) <= SIGN_S ; 
DAT_IN_FL_S(6) <= ZERO_S ; 
DAT_IN_FL_S(5) <= ZERO_S ; 
DAT_IN_FL_S(4) <= ACY_S ; 
DAT_IN_FL_S(3) <= ACY_S ; 
DAT_IN_FL_S(2) <= PARITY_S ; 
DAT_IN_FL_S(1) <= PARITY_S ; 
DAT_IN_FL_S(0) <= CY_S ; 

--process(A_OUT_S)
--begin
--if A_OUT_S(7) = '1' then
	--cnm <= '1';
--else cnm <= '0';
--end if;
--end process;

process(clk) begin
  if rising_edge(clk) then
    cnm <= A_OUT_S(6);  -- aktif-yüksek LED
  end if;
end process;

end behav ; 
------------------------------------------------------------ 
--DESIGN cpu_8085 ENDS here 
------------------------------------------------------------