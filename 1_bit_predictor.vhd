LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use STD.textio.all; 

ENTITY one_bp IS
port(rst,clk:in std_logic;
EOR:out std_logic;
b1p:out std_logic ;
b2p:out std_logic ;
miss_p:out integer;
y:out std_logic_vector(1 downto 0) );
END one_bp;

ARCHITECTURE behav OF one_bp IS 
		signal p1: 	std_logic:='0';
		signal p2: 	std_logic:='0';
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
                        y <= "00";
			if (p1 ='1') then mp<=mp+1; p1<='0'; end if;
                    elsif char = 'b' then
                        y <= "01";
			if (p1 ='0') then mp<=mp+1; p1<='1'; end if;
                    elsif char = 'c' then
                        y <= "10";
			if (p2 ='1') then mp<=mp+1; p2<='0'; end if;
                    elsif char = 'd' then
                        y <= "11";
			if (p2 ='0') then mp<=mp+1; p2<='1'; end if;
                    end if; 
	cnt:=cnt+1;
end if;

       end process;
 
b1p<=p1;
b2p<=p1;
miss_p<=mp;

end behav; 