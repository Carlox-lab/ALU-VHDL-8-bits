library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is

  port 
  (
  		 --Entradas
         A      : in std_logic_vector(7 downto 0);
         B      : in std_logic_vector(7 downto 0);
         SEL 	: in std_logic_vector(3 downto 0);
         --salidas
         W      : out std_logic_vector(15 downto 0)
  );
end entity;
architecture RTL of alu is

begin
  process(SEL)
  begin
    case SEL is
      when "0000" => --HA (Half adder)
       	W(0) <= (A(0)) xor (B(0));
        
        W(1) <= (A(1)) xor (B(1));
        
        W(2) <= (A(2)) xor (B(2));
        
        W(3) <= (A(3)) xor (B(3));
        
        W(4) <= (A(4)) xor (B(4));
        
        W(5) <= (A(5)) xor (B(5));
        
        W(6) <= (A(6)) xor (B(6));
        
        W(7) <= (A(7)) xor (B(7));
        
        W(8) <= '0';
        W(9) <= '0';
        W(10) <= '0';
        W(11) <= '0';
        W(12) <= '0';
        W(13) <= '0';
        W(14) <= '0';
        W(15) <= '0';
      when "0001" => --FA (Full adder)
      	W(0)<= A(0) xor B(0); 
  
		W(1)<= (A(1) xor B(1)) xor ((A(0) and B(0))); 
  	
		W(2)<= (A(2) xor B(2)) xor ((A(1) and B(1)) or ((A(1) xor B(1)) and (A(0) and B(0)))); 
  
		W(3)<= (A(3) xor B(3)) xor ((A(2) and B(2)) or ((A(2) xor B(2)) and ((A(1) and B(1)) or ((A(1) xor B(1)) and (A(0) and B(0)))))); 
 
		W(4)<= (A(4) xor A(4)) xor ((A(3) and B(3)) or ((A(3) xor B(3)) and ((A(2) and B(2)) or ((A(2) xor B(2)) and ((A(1) and B(1)) or ((A(1) xor B(1)) and (A(0) and B(0)))))))); 
  
		W(5)<= (A(5) xor B(5)) xor ((A(4) and B(4)) or ((A(4) xor B(4)) and ((A(3) and B(3)) or ((A(3) xor B(3)) and ((A(2) and B(2)) or ((A(2) xor B(2)) and ((A(1) and B(1)) or ((A(1) xor B(1)) and (A(0) and B(0)))))))))); 
  
		W(6)<= (A(6) xor B(6)) xor ((A(5) and B(5)) or ((A(5) xor B(5)) and ((A(4) and B(4)) or ((A(4) xor B(4)) and ((A(3) and B(3)) or ((A(3) xor B(3)) and ((A(2) and B(2)) or ((A(2) xor B(2)) and ((A(1) and B(1)) or ((A(1) xor B(1)) and (A(0) and B(0)))))))))))); 
  
		W(7)<= (A(7) xor B(7)) xor ((A(6) and B(6)) or ((A(6) xor B(6)) and ((A(5) and B(5)) or ((A(5) xor B(5)) and ((A(4) and B(4)) or ((A(4) xor B(4)) and ((A(3) and B(3)) or ((A(3) xor B(3)) and ((A(2) and B(2)) or ((A(2) xor B(2)) and ((A(1) and B(1)) or ((A(1) xor B(1)) and (A(0) and B(0)))))))))))))); 
        
        W(8)<= ((A(7) and B(7)) or ((A(7) xor B(7)) and ((A(6) and B(6)) or ((A(6) xor B(6)) and ((A(5) and B(5)) or ((A(5) xor B(5)) and ((A(4) and B(4)) or ((A(4) xor B(4)) and ((A(3) and B(3)) or ((A(3) xor B(3)) and ((A(2) and B(2)) or ((A(2) xor B(2)) and ((A(1) and B(1)) or ((A(1) xor B(1)) and (A(0) and B(0)))))))))))))))); --Carry out final
        
        W(9) <= '0';
        W(10) <= '0';
        W(11) <= '0';
        W(12) <= '0';
        W(13) <= '0';
        W(14) <= '0';
        W(15) <= '0';

      when "0010" => --multiplicacion a*b
   
      W <= std_logic_vector(unsigned(A)*unsigned(B));

      when "0011" => --mover a
      	W(0) <= A(0);
        W(1) <= A(1);
        W(2) <= A(2);
        W(3) <= A(3);
        W(4) <= A(4);
        W(5) <= A(5);
        W(6) <= A(6);
        W(7) <= A(7);
        W(8) <= '0';
        W(9) <= '0';
        W(10) <= '0';
        W(11) <= '0';
        W(12) <= '0';
        W(13) <= '0';
        W(14) <= '0';
        W(15) <= '0';
      when "0100" => --mover b
      	W(0) <= B(0);
        W(1) <= B(1);
        W(2) <= B(2);
        W(3) <= B(3);
        W(4) <= B(4);
        W(5) <= B(5);
        W(6) <= B(6);
        W(7) <= B(7);
        W(8) <= '0';
        W(9) <= '0';
        W(10) <= '0';
        W(11) <= '0';
        W(12) <= '0';
        W(13) <= '0';
        W(14) <= '0';
        W(15) <= '0';
      when "0101" => --swap a
      	W(0) <= A(7);
        W(1) <= A(6);
        W(2) <= A(5);
        W(3) <= A(4);
        W(4) <= A(3);
        W(5) <= A(2);
        W(6) <= A(1);
        W(7) <= A(0);
        W(8) <= '0';
        W(9) <= '0';
        W(10) <= '0';
        W(11) <= '0';
        W(12) <= '0';
        W(13) <= '0';
        W(14) <= '0';
        W(15) <= '0';
        W(15) <= '0';
      when "0110" => --swap b
      	W(0) <= B(7);
        W(1) <= B(6);
        W(2) <= B(5);
        W(3) <= B(4);
        W(4) <= B(3);
        W(5) <= B(2);
        W(6) <= B(1);
        W(7) <= B(0);
        W(8) <= '0';
        W(9) <= '0';
        W(10) <= '0';
        W(11) <= '0';
        W(12) <= '0';
        W(13) <= '0';
        W(14) <= '0';
        W(15) <= '0';
      when "0111" => --comparar w_0 es si son iguales w_1 A>B y w_2 A<B
      
      	W(0) <= ((A(0) xnor B(0)) and (A(1) xnor B(1)) and (A(2) xnor B(2)) and (A(3) xnor B(3)) and (A(4) xnor B(4)) and (A(5) xnor B(5)) and (A(6) xnor B(6)) and (A(7) xnor B(7)));
        
        --A>B
        
        W(1) <= (A(0) and (not B(0)) and (A(1) xor B(1)) and (A(2) xor B(2)) and (A(3) xor B(3)) and (A(4) xor B(4)) and (A(5) xor B(5)) and (A(6) xor B(6)) and (A(7) xor B(7))) or (A(1) and (not B(1)) and (A(2) xor B(2)) and (A(3) xor B(3)) and (A(4) xor B(4)) and (A(5) xor B(5)) and (A(6) xor B(6)) and (A(7) xor B(7))) or (A(2) and (not B(2)) and (A(3) xor B(3)) and (A(4) xor B(4)) and (A(5) xor B(5)) and (A(6) xor B(6)) and (A(7) xor B(7))) or (A(3) and (not B(3)) and (A(4) xor B(4)) and (A(5) xor B(5)) and (A(6) xor B(6)) and (A(7) xor B(7))) or (A(4) and (not B(4)) and (A(5) xor B(5)) and (A(6) xor B(6)) and (A(7) xor B(7))) or (A(5) and (not B(5)) and (A(6) xor B(6)) and (A(7) xor B(7))) or (A(6) and (not B(6)) and (A(7) xor B(7))) or (A(7) and (not B(7)));
        
        --A<B
        
        W(2) <= (not (A(0)) and B(0) and (A(1) xor B(1)) and (A(2) xor B(2)) and (A(3) xor B(3)) and (A(4) xor B(4)) and (A(5) xor B(5)) and (A(6) xor B(6)) and (A(7) xor B(7))) or (not (A(1)) and B(1) and (A(2) xor B(2)) and (A(3) xor B(3)) and (A(4) xor B(4)) and (A(5) xor B(5)) and (A(6) xor B(6)) and (A(7) xor B(7))) or (not (A(2)) and B(2) and (A(3) xor B(3)) and (A(4) xor B(4)) and (A(5) xor B(5)) and (A(6) xor B(6)) and (A(7) xor B(7))) or (not (A(3)) and B(3) and (A(4) xor B(4)) and (A(5) xor B(5)) and (A(6) xor B(6)) and (A(7) xor B(7))) or (not (A(4)) and B(4) and (A(5) xor B(5)) and (A(6) xor B(6)) and (A(7) xor B(7))) or (not (A(5)) and B(5) and (A(6) xor B(6)) and (A(7) xor B(7))) or (not (A(6)) and B(6) and (A(7) xor B(7))) or (not (A(7)) and B(7));
        
        W(3) <= '0';
        W(4) <= '0';
        W(5) <= '0';
        W(6) <= '0';
        W(7) <= '0';
        W(8) <= '0';
        W(9) <= '0';
        W(10) <= '0';
        W(11) <= '0';
        W(12) <= '0';
        W(13) <= '0';
        W(14) <= '0';
        W(15) <= '0';
        
        when "1000" => --Full subtractor
        
        W(0)<= A(0) xor B(0); 
  
		W(1)<= (A(1) xor B(1)) xor ((not A(0) and B(0))); 
  
		W(2)<= (A(2) xor B(2)) xor ((not A(1) and B(1)) or ((A(1) xor B(1)) and (not A(0) and B(0)))); 
  	
		W(3)<= (A(3) xor B(3)) xor ((not A(2) and B(2)) or ((A(2) xor B(2)) and ((not A(1) and B(1)) or ((A(1) xor B(1)) and (not A(0) and B(0)))))); 
 
		W(4)<= (A(4) xor A(4)) xor ((not A(3) and B(3)) or ((A(3) xor B(3)) and ((not A(2) and B(2)) or ((A(2) xor B(2)) and ((not A(1) and B(1)) or ((A(1) xor B(1)) and (not A(0) and B(0)))))))); 
  
		W(5)<= (A(5) xor B(5)) xor ((not A(4) and B(4)) or ((A(4) xor B(4)) and ((not A(3) and B(3)) or ((A(3) xor B(3)) and ((not A(2) and B(2)) or ((A(2) xor B(2)) and ((not A(1) and B(1)) or ((A(1) xor B(1)) and (not A(0) and B(0)))))))))); 
  
		W(6)<= (A(6) xor B(6)) xor ((not A(5) and B(5)) or ((A(5) xor B(5)) and ((not A(4) and B(4)) or ((A(4) xor B(4)) and ((not A(3) and B(3)) or ((A(3) xor B(3)) and ((not A(2) and B(2)) or ((A(2) xor B(2)) and ((not A(1) and B(1)) or ((A(1) xor B(1)) and (not A(0) and B(0)))))))))))); 
  
		W(7)<= (A(7) xor B(7)) xor ((not A(6) and B(6)) or ((A(6) xor B(6)) and ((not A(5) and B(5)) or ((A(5) xor B(5)) and ((not A(4) and B(4)) or ((A(4) xor B(4)) and ((not A(3) and B(3)) or ((A(3) xor B(3)) and ((not A(2) and B(2)) or ((A(2) xor B(2)) and ((not A(1) and B(1)) or ((A(1) xor B(1)) and (not A(0) and B(0))))))))))))));
        
         W(8)<= ((A(7) and B(7)) or (not (A(7) xor B(7)) and ((not A(6) and B(6)) or ((A(6) xor B(6)) and ((not A(5) and B(5)) or ((A(5) xor B(5)) and ((not A(4) and B(4)) or ((A(4) xor B(4)) and ((not A(3) and B(3)) or ((A(3) xor B(3)) and ((not A(2) and B(2)) or ((A(2) xor B(2)) and ((not A(1) and B(1)) or ((A(1) xor B(1)) and (not A(0) and B(0)))))))))))))))); 
      
      	W(9) <= '0';
     
      	W(10) <= '0';
      
      	W(11) <= '0';

        W(12) <= '0';
      
      	W(13) <= '0';
      
     	W(14) <= '0';
      
      	W(15) <= '0';
      
      	when "1001" => --Half subtractor
        
        W(0) <= A(0) xor B(0);
        
        W(1) <= A(1) xor B(1);
        
        W(2) <= A(2) xor B(2);
        
        W(3) <= A(3) xor B(3);
        
        W(4) <= A(4) xor B(4);
        
        W(5) <= A(5) xor B(5);
        
        W(6) <= A(6) xor B(6);
        
        W(7) <= A(7) xor B(7);
        
        W(8) <= '0';
        
        W(9) <= '0';
     
        W(10) <= '0';
      
        W(11) <= '0';
     
        W(12) <= '0';
    
        W(13) <= '0';
     
        W(14) <= '0';
     
        W(15) <= '0';
        
        when others =>
        W(0) <= A(0) or B(0);
        
    end case;
  end process;
end architecture;
