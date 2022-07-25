library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity ALU2 is 
port ( Clock : in std_logic;
		A,B: in unsigned (7 downto 0);
		student_id : in unsigned(3 downto 0);
		OP: in unsigned(15 downto 0);
		Neg: out std_logic;
		R1: out unsigned (3 downto 0);
		R2: out unsigned( 3 downto 0));	
		end ALU2;
		
		architecture calculation of ALU2 is 
		signal Reg1, Reg2, Result: unsigned(7 downto 0):= (others=> '0');
		signal Reg4: unsigned (0 to 7);
		begin
		
		Reg1<=A;
		Reg2<=B;
		process(Clock, OP)
		begin 
		if(rising_edge(Clock)) then 
			case OP is 
			when "0000000000000001"=>
					if (Reg2>Reg1) then
						Result<= (NOT(Reg1-Reg2)+1);
						IF  Result(7) = '1' THEN
							Neg <= '1';  
						end if;
					else
						Result<= (Reg1-Reg2);
						Neg <= '0';
					end if;
			when "0000000000000010"=>
					Result(0)<= not Reg2(0);
					Result(1)<= not Reg2(1);
					Result(2)<= not Reg2(2);
					Result(3)<= not Reg2(3);
					Result(4)<= not Reg2(4);
					Result(5)<= not Reg2(5);
					Result(6)<= not Reg2(6);
					Result(7)<= not Reg2(7);
					Result <= Result + 1;
					Neg <= '0';

			when "0000000000000100"=>
					Result(0)<= not Reg1(0);
					Result(1)<= not Reg1(1);
					Result(2)<= not Reg1(2);
					Result(3)<= not Reg1(3);
					Result(4)<= not Reg2(4);
					Result(5)<= not Reg2(5);
					Result(6)<= not Reg2(6);
					Result(7)<= not Reg2(7);
		
			when "0000000000001000"=>
					Result<= "00000000";
					
			when "0000000000010000"=>
					Result <=  Reg2 - 101;
					
			when "0000000000100000"=>
					Result(0)<= not Reg1(7);
					Result(1)<= not Reg1(6);
					Result(2)<= not Reg1(5);
					Result(3)<= not Reg1(4);
					Result(4)<= not Reg1(3);
					Result(5)<= not Reg1(2);
					Result(6)<= not Reg1(1);
					Result(7)<= not Reg1(0);
					

			when "0000000001000000"=>
					Result(0)<= not Reg2(3);
					Result(1)<= not Reg2(4);
					Result(2)<= not Reg2(5);
					Result(3)<= not Reg2(6);
					Result(4)<= not Reg2(7);
					Result(5)<= not Reg2(0);
					Result(6)<= not Reg2(1);
					Result(7)<= not Reg2(2);
					
			when "0000000010000000"=>
					Result <=  Reg1 + 011;
					
			when "0000000100000000"=>
					Result<= not Reg2;
					
			when OTHERS=>
					Result<="00000000";
					
					
			end case;
			end if;
				
			R1<= Result(3 downto 0);
			R2<= Result(7 downto 4);
			
			
			end process;
		
			end calculation;