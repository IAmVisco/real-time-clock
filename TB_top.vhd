--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   20:41:12 12/02/2019
-- Design Name:
-- Module Name:   C:/Projects/RTC_2/TB_top.vhd
-- Project Name:  RTC_2
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: top_rtc_clock_ax309
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

ENTITY TB_top IS
END TB_top;

ARCHITECTURE behavior OF TB_top IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT top_rtc_clock_ax309
    PORT(
         RESET : IN  std_logic;
         RESTART : IN  std_logic;
         CLK : IN  std_logic;
         VGA_HSYNC : OUT  std_logic;
         VGA_VSYNC : OUT  std_logic;
         RGB : OUT  std_logic_vector(2 downto 0);
         T_DT : INOUT  std_logic;
         T_CK : OUT  std_logic;
         T_CE : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal RESET : std_logic := '0';
   signal RESTART : std_logic := '0';
   signal CLK : std_logic := '0';

	--BiDirs
   signal T_DT : std_logic;

 	--Outputs
   signal VGA_HSYNC : std_logic;
   signal VGA_VSYNC : std_logic;
   signal RGB : std_logic_vector(2 downto 0);
   signal T_CK : std_logic;
   signal T_CE : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: top_rtc_clock_ax309 PORT MAP (
          RESET => RESET,
          RESTART => RESTART,
          CLK => CLK,
          VGA_HSYNC => VGA_HSYNC,
          VGA_VSYNC => VGA_VSYNC,
          RGB => RGB,
          T_DT => T_DT,
          T_CK => T_CK,
          T_CE => T_CE
        );
    CLK <= not CLK after CLK_period;

END;
