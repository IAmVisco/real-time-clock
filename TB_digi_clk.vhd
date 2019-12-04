LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_digi_clk IS
END TB_digi_clk;

ARCHITECTURE behavior OF TB_digi_clk IS
    COMPONENT top_digi_clk
    PORT(
         RESET : IN  std_logic;
         RESTART : IN  std_logic;
         CLK : IN  std_logic;
         VGA_HSYNC : OUT  std_logic;
         VGA_VSYNC : OUT  std_logic;
         RGB : OUT  std_logic_vector(2 downto 0)
         --SECS : OUT  integer;
         --MINS : OUT  integer;
         --HOURS : OUT  integer
        );
    END COMPONENT;


   --Inputs
   signal RESET : std_logic := '0';
   signal RESTART : std_logic := '0';
   signal CLK : std_logic := '0';

  --Outputs
   signal VGA_HSYNC : std_logic;
   signal VGA_VSYNC : std_logic;
   signal RGB : std_logic_vector(2 downto 0);
   signal SECS : integer;
   signal MINS : integer;
   signal HOURS : integer;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;

BEGIN
   fake_clk: top_digi_clk PORT MAP (
          RESET => RESET,
          RESTART => RESTART,
          CLK => CLK,
          VGA_HSYNC => VGA_HSYNC,
          VGA_VSYNC => VGA_VSYNC,
          RGB => RGB
          --SECS => SECS,
          --MINS => MINS,
          --HOURS => HOURS
        );

   CLK <= not CLK after CLK_period;
END;
