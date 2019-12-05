library ieee;
use ieee.std_logic_1164.all;

package ctrl_types_pkg is
    component vga_driver is
    port (
        CLK         : in   std_logic;
        RST         : in   std_logic;
        HALF_SECOND : in   std_logic;
        SECONDS     : in   integer;
        MINUTES     : in   integer;
        HOURS       : in   integer;
        HSYNC       : out  std_logic;
        VSYNC       : out  std_logic;
        RED         : out  std_logic_vector (4 downto 0);
        GREEN       : out  std_logic_vector (4 downto 0);
        BLUE        : out  STD_LOGIC_VECTOR (4 downto 0)
    );
    end component;

    component digi_clk is
    port (
        clk1         : in  std_logic;
        inc_hour     : in  std_logic;
        inc_min      : in  std_logic;
        half_seconds : out std_logic;
        seconds      : out integer;
        minutes      : out integer;
        hours        : out integer
    );
    end component;

    component debounce is
      generic (
          clk_freq    : integer := 50_000_000;
          stable_time : integer := 10
      );
      port (
          clk     : in  std_logic;
          reset_n : in  std_logic;
          button  : in  std_logic;
          result  : out std_logic
      );
    end component;

end ctrl_types_pkg;
