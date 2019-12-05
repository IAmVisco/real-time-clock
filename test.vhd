--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   19:32:04 12/05/2019
-- Design Name:
-- Module Name:   C:/Projects/RTC_2/test.vhd
-- Project Name:  RTC_2
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: digi_clk
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

ENTITY test IS
END test;

ARCHITECTURE behavior OF test IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT digi_clk
    PORT(
         clk1 : IN  std_logic;
         inc_hour : IN  std_logic;
         inc_min : IN  std_logic;
         half_seconds : OUT  std_logic;
         seconds : OUT  integer;
         minutes : OUT  integer;
         hours : OUT  integer
        );
    END COMPONENT;


   --Inputs
   signal clk1 : std_logic := '0';
   signal inc_hour : std_logic := '0';
   signal inc_min : std_logic := '0';

 	--Outputs
   signal half_seconds : std_logic;
   signal seconds : integer;
   signal minutes : integer;
   signal hours : integer;

   -- Clock period definitions
   constant clk1_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: digi_clk PORT MAP (
          clk1 => clk1,
          inc_hour => inc_hour,
          inc_min => inc_min,
          half_seconds => half_seconds,
          seconds => seconds,
          minutes => minutes,
          hours => hours
        );

      clk1 <= clk1 after clk1_period;
END;
