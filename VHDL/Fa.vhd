library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity fa is
		port ( a,b,c : in std_logic;
           sum,carry : out std_logic);
end fa;

architecture fa1 of fa is

begin
sum<= a xor b xor c;
carry<=(a and b)or(b and c)or(c and a);

end fa1;