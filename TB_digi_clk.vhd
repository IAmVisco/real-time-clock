--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   12:12:33 12/04/2019
-- Design Name:
-- Module Name:   C:/Projects/RTC_2/TB_digi_clk.vhd
-- Project Name:  RTC_2
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: top_digi_clk
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY TB_digi_clk IS
END TB_digi_clk;

ARCHITECTURE behavior OF TB_digi_clk IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT top_digi_clk
    PORT(
         RESET : IN  std_logic;
         RESTART : IN  std_logic;
         CLK : IN  std_logic;
         VGA_HSYNC : OUT  std_logic;
         VGA_VSYNC : OUT  std_logic;
         RED : OUT  std_logic_vector(4 downto 0);
         GREEN : OUT  std_logic_vector(5 downto 0);
         BLUE : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal RESET : std_logic := '0';
   signal RESTART : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal VGA_HSYNC : std_logic;
   signal VGA_VSYNC : std_logic;
   signal RED : std_logic_vector(4 downto 0);
   signal GREEN : std_logic_vector(5 downto 0);
   signal BLUE : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   fake_clk: top_digi_clk PORT MAP (
          RESET => RESET,
          RESTART => RESTART,
          CLK => CLK,
          VGA_HSYNC => VGA_HSYNC,
          VGA_VSYNC => VGA_VSYNC,
          RED => RED,
          GREEN => GREEN,
          BLUE => BLUE
        );

    CLK <= not CLK after CLK_period;
END;
