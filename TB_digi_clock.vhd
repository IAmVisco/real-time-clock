LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_digi_clock IS
END TB_digi_clock;
 
ARCHITECTURE behavior OF TB_digi_clock IS  
	COMPONENT digi_clk
	PORT(
		clk1 : IN  std_logic;
		seconds : OUT  std_logic_vector(5 downto 0);
		minutes : OUT  std_logic_vector(5 downto 0);
		hours : OUT  std_logic_vector(4 downto 0)
	  );
	END COMPONENT;
   signal clk1 : std_logic := '0';

   signal seconds : std_logic_vector(5 downto 0);
   signal minutes : std_logic_vector(5 downto 0);
   signal hours : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk1_period : time := 10 ns;
BEGIN
 
   uut: digi_clk PORT MAP (
          clk1 => clk1,
          seconds => seconds,
          minutes => minutes,
          hours => hours
        ); 

	clk1 <= not clk1 after clk1_period;
END;
