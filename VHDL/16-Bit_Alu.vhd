library ieee;
use ieee.std_logic_1164.all;

entity Alu is
	port( Ac,Dr,Inp:in std_logic_vector(15 downto 0);
					  C:in std_logic;
					  S:in std_logic_vector(3 downto 0);
					  Q:out std_logic_vector(15 downto 0);
					  o_flow:out std_logic);
end Alu;

architecture AluCalisma of Alu is

	component fa is
		port ( a,b,c : in std_logic;
           sum,carry : out std_logic);
	end component;
	
	component mux is
	port( a,b,c,d,e,f,g,h,j,k,l,m,n,o,p,r:in std_logic;
			s:in std_logic_vector(3 downto 0);
			Qmux:out std_logic);
	end component;
	signal s0,s1,s2,s3,s4,S5,s6:std_logic_vector(15 downto 0);
	signal s7:std_logic;
	signal f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15:std_logic;
	signal z,zb:std_logic_vector(15 downto 0);
begin 
-- LOJİK İŞLEMLER
	s0<= Ac xor Dr;
	s1<= Ac or Dr;
	s2<= Ac and Dr;
	s3<= Ac xnor Dr;
	s4<= not Dr;
	z<= "0000000000000001";
	zb<= not z;

-- ALU İŞLEMLERİ -- 

-- S: 0000 => ac + dr = ac + dr + 0 
-- S: 0001 => ac + dr + c = ac + dr + cin
-- S: 0010 => ac - dr = ac + not(dr) +1 
-- S: 0011 => ac + not(dr) = ac + not(dr) + 0
-- S: 0100 => ac yi sola kaydırma
-- S: 0101 => ac + 1 = ac + 0 + 1
-- S: 0110 => dr = 0 + dr + 0
-- S: 0111 => dr + 1 = 0 + dr + 1
-- S: 1000 => input = input + 0 + 0
-- S: 1001 => dr - 1 = not(1) + dr + 1
-- S: 1010 => ac - 1 = ac + not(1) + 1
-- S: 1011 => input + 1 = input + 0 + 1
-- S: 1100 => ac xor dr
-- S: 1101 => ac or dr
-- S: 1110 => ac and dr
-- S: 1111 => ac yi döngüsel sağa kaydırma

-- ARİTMETİK ve LOJİK İŞLEMLER İÇİN AC MUX LARI
	acmux0: mux port map(a=>Ac(0),b=>Ac(0),c=>Ac(0),d=>Ac(0),e=>'0',f=>Ac(0),g=>'0',h=>'0',j=>Inp(0),k=>zb(0),l=>Ac(0),m=>Inp(0),n=>s0(0),o=>s1(0),p=>s2(0),r=>Ac(1),S=>s,Qmux=>S5(0));
	acmux1: mux port map(a=>Ac(1),b=>Ac(1),c=>Ac(1),d=>Ac(1),e=>Ac(0),f=>Ac(1),g=>'0',h=>'0',j=>Inp(1),k=>zb(1),l=>Ac(1),m=>Inp(1),n=>s0(1),o=>s1(1),p=>s2(1),r=>Ac(2),S=>s,Qmux=>S5(1));
	acmux2: mux port map(a=>Ac(2),b=>Ac(2),c=>Ac(2),d=>Ac(2),e=>Ac(1),f=>Ac(2),g=>'0',h=>'0',j=>Inp(2),k=>zb(2),l=>Ac(2),m=>Inp(2),n=>s0(2),o=>s1(2),p=>s2(2),r=>Ac(3),S=>s,Qmux=>S5(2));
	acmux3: mux port map(a=>Ac(3),b=>Ac(3),c=>Ac(3),d=>Ac(3),e=>Ac(2),f=>Ac(3),g=>'0',h=>'0',j=>Inp(3),k=>zb(3),l=>Ac(3),m=>Inp(3),n=>s0(3),o=>s1(3),p=>s2(3),r=>Ac(4),S=>s,Qmux=>S5(3));
	acmux4: mux port map(a=>Ac(4),b=>Ac(4),c=>Ac(4),d=>Ac(4),e=>Ac(3),f=>Ac(4),g=>'0',h=>'0',j=>Inp(4),k=>zb(4),l=>Ac(4),m=>Inp(4),n=>s0(4),o=>s1(4),p=>s2(4),r=>Ac(5),S=>s,Qmux=>S5(4));
	acmux5: mux port map(a=>Ac(5),b=>Ac(5),c=>Ac(5),d=>Ac(5),e=>Ac(4),f=>Ac(5),g=>'0',h=>'0',j=>Inp(5),k=>zb(5),l=>Ac(5),m=>Inp(5),n=>s0(5),o=>s1(5),p=>s2(5),r=>Ac(6),S=>s,Qmux=>S5(5));
	acmux6: mux port map(a=>Ac(6),b=>Ac(6),c=>Ac(6),d=>Ac(6),e=>Ac(5),f=>Ac(6),g=>'0',h=>'0',j=>Inp(6),k=>zb(6),l=>Ac(6),m=>Inp(6),n=>s0(6),o=>s1(6),p=>s2(6),r=>Ac(7),S=>s,Qmux=>S5(6));
	acmux7: mux port map(a=>Ac(7),b=>Ac(7),c=>Ac(7),d=>Ac(7),e=>Ac(6),f=>Ac(7),g=>'0',h=>'0',j=>Inp(7),k=>zb(7),l=>Ac(7),m=>Inp(7),n=>s0(7),o=>s1(7),p=>s2(7),r=>Ac(8),S=>s,Qmux=>S5(7));
	acmux8: mux port map(a=>Ac(8),b=>Ac(8),c=>Ac(8),d=>Ac(8),e=>Ac(7),f=>Ac(8),g=>'0',h=>'0',j=>Inp(8),k=>zb(8),l=>Ac(8),m=>Inp(8),n=>s0(8),o=>s1(8),p=>s2(8),r=>Ac(9),S=>s,Qmux=>S5(8));
	acmux9: mux port map(a=>Ac(9),b=>Ac(9),c=>Ac(9),d=>Ac(9),e=>Ac(8),f=>Ac(9),g=>'0',h=>'0',j=>Inp(9),k=>zb(9),l=>Ac(9),m=>Inp(9),n=>s0(9),o=>s1(9),p=>s2(9),r=>Ac(10),S=>s,Qmux=>S5(9));
	acmux10: mux port map(a=>Ac(10),b=>Ac(10),c=>Ac(10),d=>Ac(10),e=>Ac(9),f=>Ac(10),g=>'0',h=>'0',j=>Inp(10),k=>zb(10),l=>Ac(10),m=>Inp(10),n=>s0(10),o=>s1(10),p=>Ac(11),r=>s3(10),S=>s,Qmux=>S5(10));
	acmux11: mux port map(a=>Ac(11),b=>Ac(11),c=>Ac(11),d=>Ac(11),e=>Ac(10),f=>Ac(11),g=>'0',h=>'0',j=>Inp(11),k=>zb(11),l=>Ac(11),m=>Inp(11),n=>s0(11),o=>s1(11),p=>Ac(12),r=>s3(11),S=>s,Qmux=>S5(11));
	acmux12: mux port map(a=>Ac(12),b=>Ac(12),c=>Ac(12),d=>Ac(12),e=>Ac(11),f=>Ac(12),g=>'0',h=>'0',j=>Inp(12),k=>zb(12),l=>Ac(12),m=>Inp(12),n=>s0(12),o=>s1(12),p=>Ac(13),r=>s3(12),S=>s,Qmux=>S5(12));
	acmux13: mux port map(a=>Ac(13),b=>Ac(13),c=>Ac(13),d=>Ac(13),e=>Ac(12),f=>Ac(13),g=>'0',h=>'0',j=>Inp(13),k=>zb(13),l=>Ac(13),m=>Inp(13),n=>s0(13),o=>s1(13),p=>Ac(14),r=>s3(13),S=>s,Qmux=>S5(13));
	acmux14: mux port map(a=>Ac(14),b=>Ac(14),c=>Ac(14),d=>Ac(14),e=>Ac(13),f=>Ac(14),g=>'0',h=>'0',j=>Inp(14),k=>zb(14),l=>Ac(14),m=>Inp(14),n=>s0(14),o=>s1(14),p=>Ac(15),r=>s3(14),S=>s,Qmux=>S5(14));
	acmux15: mux port map(a=>Ac(15),b=>Ac(15),c=>Ac(15),d=>Ac(15),e=>Ac(14),f=>Ac(15),g=>'0',h=>'0',j=>Inp(15),k=>zb(15),l=>Ac(15),m=>Inp(15),n=>s0(15),o=>s1(15),p=>Ac(0),r=>s3(15),S=>s,Qmux=>S5(15));
	
-- ARİTMETİK ve LOJİK İŞLEMLER İÇİN DR MUX LARI
	drmux0: mux port map (a=>Dr(0),b=>Dr(0),c=>s4(0),d=>s4(0),e=>'0',f=>'0',g=>Dr(0),h=>Dr(0),j=>'0',k=>Dr(0),l=>zb(0),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(0));
	drmux1: mux port map (a=>Dr(1),b=>Dr(1),c=>s4(1),d=>s4(1),e=>'0',f=>'0',g=>Dr(1),h=>Dr(1),j=>'0',k=>Dr(1),l=>zb(1),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(1));
	drmux2: mux port map (a=>Dr(2),b=>Dr(2),c=>s4(2),d=>s4(2),e=>'0',f=>'0',g=>Dr(2),h=>Dr(2),j=>'0',k=>Dr(2),l=>zb(2),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(2));
	drmux3: mux port map (a=>Dr(3),b=>Dr(3),c=>s4(3),d=>s4(3),e=>'0',f=>'0',g=>Dr(3),h=>Dr(3),j=>'0',k=>Dr(3),l=>zb(3),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(3));
	drmux4: mux port map (a=>Dr(4),b=>Dr(4),c=>s4(4),d=>s4(4),e=>'0',f=>'0',g=>Dr(4),h=>Dr(4),j=>'0',k=>Dr(4),l=>zb(4),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(4));
	drmux5: mux port map (a=>Dr(5),b=>Dr(5),c=>s4(5),d=>s4(5),e=>'0',f=>'0',g=>Dr(5),h=>Dr(5),j=>'0',k=>Dr(5),l=>zb(5),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(5));
	drmux6: mux port map (a=>Dr(6),b=>Dr(6),c=>s4(6),d=>s4(6),e=>'0',f=>'0',g=>Dr(6),h=>Dr(6),j=>'0',k=>Dr(6),l=>zb(6),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(6));
	drmux7: mux port map (a=>Dr(7),b=>Dr(7),c=>s4(7),d=>s4(7),e=>'0',f=>'0',g=>Dr(7),h=>Dr(7),j=>'0',k=>Dr(7),l=>zb(7),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(7));
	drmux8: mux port map (a=>Dr(8),b=>Dr(8),c=>s4(8),d=>s4(8),e=>'0',f=>'0',g=>Dr(8),h=>Dr(8),j=>'0',k=>Dr(8),l=>zb(8),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(8));
	drmux9: mux port map (a=>Dr(9),b=>Dr(9),c=>s4(9),d=>s4(9),e=>'0',f=>'0',g=>Dr(9),h=>Dr(9),j=>'0',k=>Dr(9),l=>zb(9),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(9));
	drmux10: mux port map (a=>Dr(10),b=>Dr(10),c=>s4(10),d=>s4(10),e=>'0',f=>'0',g=>Dr(10),h=>Dr(10),j=>'0',k=>Dr(10),l=>zb(10),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(10));
	drmux11: mux port map (a=>Dr(11),b=>Dr(11),c=>s4(11),d=>s4(11),e=>'0',f=>'0',g=>Dr(11),h=>Dr(11),j=>'0',k=>Dr(11),l=>zb(11),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(11));
	drmux12: mux port map (a=>Dr(12),b=>Dr(12),c=>s4(12),d=>s4(12),e=>'0',f=>'0',g=>Dr(12),h=>Dr(12),j=>'0',k=>Dr(12),l=>zb(12),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(12));
	drmux13: mux port map (a=>Dr(13),b=>Dr(13),c=>s4(13),d=>s4(13),e=>'0',f=>'0',g=>Dr(13),h=>Dr(13),j=>'0',k=>Dr(13),l=>zb(13),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(13));
	drmux14: mux port map (a=>Dr(14),b=>Dr(14),c=>s4(14),d=>s4(14),e=>'0',f=>'0',g=>Dr(14),h=>Dr(14),j=>'0',k=>Dr(14),l=>zb(14),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(14));
	drmux15: mux port map (a=>Dr(15),b=>Dr(15),c=>s4(15),d=>s4(15),e=>'0',f=>'0',g=>Dr(15),h=>Dr(15),j=>'0',k=>Dr(15),l=>zb(15),m=>'0',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s6(15));
	
-- ARİTMETİK VE LOJİK İŞLEMLER İÇİN CİN MUX U 	
	cmux: mux port map (a=>'0',b=>C,c=>'1',d=>'0',e=>'0',f=>'1',g=>'0',h=>'1',j=>'0',k=>'1',l=>'1',m=>'1',n=>'0',o=>'0',p=>'0',r=>'0',S=>s,Qmux=>s7);
	
-- ARİTMETİK VE LOJİK İŞLEMLER İÇİN FULL ADDER MUX LARI
	fa0: fa port map (a=>S5(0),b=>s6(0),c=>s7,sum=>Q(0),carry=>f0);
	fa1: fa port map (a=>S5(1),b=>s6(1),c=>f0,sum=>Q(1),carry=>f1);
	fa2: fa port map (a=>S5(2),b=>s6(2),c=>f1,sum=>Q(2),carry=>f2);
	fa3: fa port map (a=>S5(3),b=>s6(3),c=>f2,sum=>Q(3),carry=>f3);
	fa4: fa port map (a=>S5(4),b=>s6(4),c=>f3,sum=>Q(4),carry=>f4);
	fa5: fa port map (a=>S5(5),b=>s6(5),c=>f4,sum=>Q(5),carry=>f5);
	fa6: fa port map (a=>S5(6),b=>s6(6),c=>f5,sum=>Q(6),carry=>f6);
	fa7: fa port map (a=>S5(7),b=>s6(7),c=>f6,sum=>Q(7),carry=>f7);
	fa8: fa port map (a=>S5(8),b=>s6(8),c=>f7,sum=>Q(8),carry=>f8);
	fa9: fa port map (a=>S5(9),b=>s6(9),c=>f8,sum=>Q(9),carry=>f9);
	fa10: fa port map (a=>S5(10),b=>s6(10),c=>f9,sum=>Q(10),carry=>f10);
	fa11: fa port map (a=>S5(11),b=>s6(11),c=>f10,sum=>Q(11),carry=>f11);
	fa12: fa port map (a=>S5(12),b=>s6(12),c=>f11,sum=>Q(12),carry=>f12);
	fa13: fa port map (a=>S5(13),b=>s6(13),c=>f12,sum=>Q(13),carry=>f13);
	fa14: fa port map (a=>S5(14),b=>s6(14),c=>f13,sum=>Q(14),carry=>f14);
	fa15: fa port map (a=>S5(15),b=>s6(15),c=>f14,sum=>Q(15),carry=>f15);
	o_flow <= f15;
end AluCalisma;