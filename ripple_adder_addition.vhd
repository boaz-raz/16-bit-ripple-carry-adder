----------------------------------------------------------------------------------
-- Engineer: Boaz
-- Create Date: 02/22/2021
-- Project Name: Ripple Adder Addition
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ripple_adder_addition is
port( A :  in std_logic_vector(15 downto 0);  -- 16 bit input 1
      B :  in std_logic_vector(15 downto 0);  -- 16 bit input 2
      SUM :   out std_logic_vector(15 downto 0);   -- 16 bit SUM
      CARRY,OVERFLOW : out std_logic   -- CARRY out.
);
end ripple_adder_addition;



architecture Behavioral of ripple_adder_addition is

--temporary signal declarations(for intermediate CARRY's).
signal c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15 : std_logic := '0';


begin

--first full adder
SUM(0) <= A(0) xor B(0);  --SUM calculation
c0 <= A(0) and B(0);      --CARRY calculation
--second full adder
SUM(1) <= A(1) xor B(1) xor c0;
c1 <= (A(1) and B(1)) or (A(1) and c0) or (B(1) and c0);
--third full adder
SUM(2) <= A(2) xor B(2) xor c1;
c2 <= (A(2) and B(2)) or (A(2) and c1) or (B(2) and c1);
--fourth full adder
SUM(3) <= A(3) xor B(3) xor c2;
c3 <= (A(3) and B(3)) or (A(3) and c2) or (B(3) and c2);
--fifth full adder
SUM(4) <= A(4) xor B(4) xor c3;
c4 <= (A(4) and B(4)) or (A(4) and c3) or (B(4) and c3);
--sixth full adder
SUM(5) <= A(5) xor B(5) xor c4;
c5 <= (A(5) and B(5)) or (A(5) and c4) or (B(5) and c4);
--7 full adder
SUM(6) <= A(6) xor B(6) xor c5;
c6 <= (A(6) and B(6)) or (A(6) and c5) or (B(6) and c5);
--8 full adder
SUM(7) <= A(7) xor B(7) xor c6;
c7 <= (A(7) and B(7)) or (A(7) and c6) or (B(7) and c6);
--8 full adder
SUM(8) <= A(8) xor B(8) xor c7;
c8 <= (A(8) and B(8)) or (A(8) and c7) or (B(8) and c7);
--9 full adder
SUM(9) <= A(9) xor B(9) xor c8;
c9 <= (A(9) and B(9)) or (A(9) and c8) or (B(9) and c8);
--10 full adder
SUM(10) <= A(10) xor B(10) xor c9;
c10 <= (A(10) and B(10)) or (A(10) and c9) or (B(10) and c9);
--11 full adder
SUM(11) <= A(11) xor B(11) xor c10;
c11 <= (A(11) and B(11)) or (A(11) and c10) or (B(11) and c10);
--12 full adder
SUM(12) <= A(12) xor B(12) xor c11;
c12 <= (A(12) and B(12)) or (A(12) and c11) or (B(12) and c11);
--13 full adder
SUM(13) <= A(13) xor B(13) xor c12;
c13 <= (A(13) and B(13)) or (A(13) and c12) or (B(13) and c12);
--14 full adder
SUM(14) <= A(14) xor B(14) xor c13;
c14 <= (A(14) and B(14)) or (A(14) and c13) or (B(14) and c13);
--15 full adder
SUM(15) <= A(15) xor B(15) xor c14;
c15 <= (A(15) and B(15)) or (A(15) and c14) or (B(15) and c14);

OVERFLOW <= c14 xor c15;

--final CARRY assignment
CARRY <= c15;

-- check for overflow 

process(c15)
begin
	if c15 > '0' then
		report "overflow was found";
		else
			report "overflow was NOT found";
		end if;
end process;



end Behavioral;
