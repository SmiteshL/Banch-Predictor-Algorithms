library ieee;
use ieee.std_logic_1164.all;

entity two_bp_tb is
end entity;

architecture foo of two_bp_tb is
    signal rst:     std_logic := '1';
    signal clk:     std_logic := '0';
    signal eor:     std_logic;
    signal b1p:     std_logic_vector(1 downto 0) ;
    signal b2p:	    std_logic_vector(1 downto 0) ;
    signal miss_p:  integer ;
    signal y:       std_logic_vector(1 downto 0) ;
begin

DUT:
    entity work.two_bp
        port map (
            rst => rst,
            clk => clk,
            eor => eor,
	    b1p=>b1p,
	    b2p=>b2p,
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