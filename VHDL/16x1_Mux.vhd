library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port( a,b,c,d,e,f,g,h,j,k,l,m,n,o,p,r:in std_logic;
			s:in std_logic_vector(3 downto 0);
			Qmux:out std_logic);
end mux;

architecture Mux of mux is
  begin
   process(a,b,c,d,e,f,g,h,j,k,l,m,n,o,p,r,s)
    begin
    if(s="0000")then
    Qmux<=a;
     elsif(s="0001")then
    Qmux<=b;
      elsif(s="0010")then
    Qmux<=c;
      elsif(s="0011")then
    Qmux<=d;
      elsif(s="0100")then
    Qmux<=e;
      elsif(s="0101")then
    Qmux<=f;
	  elsif(s="0110")then
    Qmux<=g;
      elsif(s="0111")then
    Qmux<=h;
      elsif(s="1000")then
    Qmux<=j;
      elsif(s="1001")then
    Qmux<=k;
      elsif(s="1010")then
    Qmux<=l;
	  elsif(s="1011")then
    Qmux<=m;
	  elsif(s="1100")then
    Qmux<=n;
      elsif(s="1101")then
    Qmux<=o;
	  elsif(s="1110")then
    Qmux<=p;
	  else
	Qmux<=r;
   end if ;
  end process ;
 end Mux;