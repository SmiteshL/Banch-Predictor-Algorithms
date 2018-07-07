library ieee;
use ieee.std_logic_1164.all;

entity corr_bp_tb is
end entity;

architecture foo of corr_bp_tb is
    signal rst:     std_logic := '1';
    signal clk:     std_logic := '0';
    signal eor:     std_logic;
    signal b1p,b2p,b3p,b4p,b5p,b6p,b7p,b8p: std_logic_vector(1 downto 0) ;
    signal b16p,b15p,b14p,b13p,b12p,b11p,b10p,b9p: std_logic_vector(1 downto 0) ;
    signal bht:     std_logic_vector(3 downto 0) ;
    signal miss_p: integer ;
    signal y:       std_logic_vector(1 downto 0) ;
begin

DUT:
    entity work.corr_bp
        port map (
            rst => rst,
            clk => clk,
            eor => eor,
		b1p=>b1p,
		b2p=>b2p,
		b3p=>b3p,
		b4p=>b4p,
		b5p=>b5p,
		b6p=>b6p,
		b7p=>b7p,
		b8p=>b8p,
		b9p=>b9p,
		b10p=>b10p,
		b11p=>b11p,
		b12p=>b12p,
		b13p=>b13p,
		b14p=>b14p,
		b15p=>b15p,
		b16p=>b16p,
		bht=>bht,
		miss_p => miss_p,
            y => y
        );
CLOCK:
    process
    begin
        wait for 5 ns;
        clk <= not clk;

    end process;
STIMULUS:
    process 
    begin
        wait for 10 ns;
        rst <= '0';
        wait; 
    end process;
end architecture;
