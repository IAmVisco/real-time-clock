LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY vga_test IS
END vga_test;

ARCHITECTURE behavior OF vga_test IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT vga_driver
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         HSYNC : OUT  std_logic;
         VSYNC : OUT  std_logic;
         RGB : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '1';

 	--Outputs
   signal HSYNC : std_logic;
   signal VSYNC : std_logic;
   signal RGB : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;

BEGIN
   vga_test_component: vga_driver PORT MAP (
          CLK => CLK,
          RST => RST,
          HSYNC => HSYNC,
          VSYNC => VSYNC,
          RGB => RGB
        );

  RST <= '0';
  CLK <= not CLK after CLK_period;
END;
