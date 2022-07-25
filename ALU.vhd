library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity ALU is 
port ( Clock : in std_logic;
		A,B: in unsigned (7 downto 0);
		student_id : in unsigned(3 downto 0);
		OP: in unsigned(15 downto 0);
		Neg: out std_logic;
		R1: out unsigned (3 downto 0);
		R2: out unsigned( 3 downto 0));	
		end ALU;
		
		architecture calculation of ALU is 
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
					Result<= Reg1+Reg2;
			when "0000000000000010"=>
					if (Reg2>Reg1) then
						Result<= (NOT(Reg1-Reg2)+1);
						IF  Result(7) = '1' THEN
							Neg <= '1';  
						end if;
					else
						Result<= (Reg1-Reg2);
						Neg <= '0';
					end if;
					
			when "0000000000000100"=>
					Result<= (NOT(Reg1));
					Neg <= '0';
		
			when "0000000000001000"=>
					Result<= (Reg1 NAND Reg2);
					Neg <= '0';
			when "0000000000010000"=>
					Result <= (Reg1 NOR Reg2);
					Neg <= '0';
			when "0000000000100000"=>
					Result<= (Reg1 AND Reg2);
					Neg <= '0';
			when "0000000001000000"=>
					Result<= (Reg1 Or Reg2);
					Neg <= '0';
			when "0000000010000000"=>
					Result <= (Reg1 xor Reg2);
					Neg <= '0';
			when "0000000100000000"=>
					Result<= (Reg1 xnor Reg2);
					Neg <= '0';
			when OTHERS=>
					Result<="00000000";
					Neg <= '0';
					
			end case;
			end if;
				
			R1<= Result(3 downto 0);
			R2<= Result(7 downto 4);
			
			
			end process;
		
			end calculation;
			