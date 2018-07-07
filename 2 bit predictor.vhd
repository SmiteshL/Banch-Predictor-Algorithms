
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;
use STD.textio.all; 

ENTITY two_bp IS
port(rst,clk:in std_logic;
EOR:out std_logic;
b1p:out std_logic_vector(1 downto 0) ;
b2p:out std_logic_vector(1 downto 0) ;
miss_p:out integer;
y:out std_logic_vector(1 downto 0) );
END two_bp;

ARCHITECTURE behav OF two_bp IS 

		signal buf1: 	std_logic_vector(1 downto 0):="00";
		signal buf2: 	std_logic_vector(1 downto 0):="00";
		signal mp:      integer:=0;

BEGIN
process (rst, clk) 
            file ip_file:         text;
            variable line_content:  character;
            variable line_num:      line;
            variable char:          character := '0'; 
            variable cnt:           integer:=0;       

        begin
        file_open (ip_file, "mainmaintest.txt", READ_MODE);
        eor <= '1';  
if rst = '1' then
                eor <= '0';
            elsif rising_edge(clk) then 
                    readline (ip_file, line_num); 
                    read (line_num, line_content);  
                 
                    char := line_content;
			if char = 'a' then 
                        y <= "00"; if (buf1 /="00") then buf1 <= buf1-1; 
			if ((buf1 ="10")or(buf1 ="01")) then mp<=mp+1; end if;end if;
                    elsif char = 'b' then
                        y <= "01"; if (buf1 /="11") then buf1 <= buf1+1;
			if ((buf1 ="01")or(buf1 ="10")) then mp<=mp+1; end if;end if;
                    elsif char = 'c' then
                        y <= "10"; if (buf2 /="00") then  buf2<=buf2-1;
			if ((buf2 ="10")or(buf2 ="01")) then mp<=mp+1;  end if;end if;
                    elsif char = 'd' then
                        y <= "11"; if (buf2 /="11") then  buf2<=buf2+1; 
			if ((buf2 ="01")or(buf2 ="10")) then mp<=mp+1; end if;end if;
              end if; 
	cnt:=cnt+1;

end if;

       end process;
 
b1p<=buf1;
b2p<=buf2;
miss_p<=mp;

end behav; 