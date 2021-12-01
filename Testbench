

library IEEE;
use IEEE.std_logic_1164.all;


entity test is
end entity;

architecture tb of test is
component alu is
  port 
  (
         --Entradas
         A      : in std_logic_vector(7 downto 0);
         B      : in std_logic_vector(7 downto 0);
         SEL 	: in std_logic_vector(3 downto 0);
         --salidas
         W      : out std_logic_vector(15 downto 0)
  );
end component;

--entradas
signal  A_t      : std_logic_vector(7 downto 0);
signal  B_t      : std_logic_vector(7 downto 0);
signal  SEL_t 	 : std_logic_vector(3 downto 0);
signal  W_t      : std_logic_vector(15 downto 0);


begin
  UUT: alu port map(A_t, B_t, SEL_t, W_t);
  process
  
  begin
  
    A_t <= "01010101";
    B_t <= "11110000";
    
--HALF ADDER
    SEL_t <= "0000";
	wait for 1 ns;
--FULL ADDER
    SEL_t <= "0001";
	wait for 1 ns;
--MULTIPLY
    SEL_t <= "0010";
	wait for 1 ns;
--MOVE A
    SEL_t <= "0011";
	wait for 1 ns;
--MOVE B
    SEL_t <= "0100";
	wait for 1 ns;
--SWAP A
    SEL_t <= "0101";
	wait for 1 ns;
--SWAP B
    SEL_t <= "0110";
	wait for 1 ns;
--COMPARE W_0 FOR A=B, W_1 FOR A>B, W_2 FOR A<B
    SEL_t <= "0111";
	wait for 1 ns;
--FULL SUBTRACTOR
    SEL_t <= "1000";
	wait for 1 ns;
--HALF SUBTRACTOR
    SEL_t <= "1001";
	wait for 1 ns;

    wait;
  
  end process;

end architecture;
