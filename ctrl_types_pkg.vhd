library ieee;
use ieee.std_logic_1164.all;

package ctrl_types_pkg is
    component rtl_ds1302 is
        generic (
            TD              : in time;                              -- simulation time;
            DIV_SCL         : in integer                            -- Clock division for SCL: clk50m/DIV_SCL
            );
        port(
            -- global ports
            clk50m          : in     std_logic;                     -- System frequency (50 MHz)
            rstn            : in     std_logic;                     -- '0' - negative reset
            -- main interface
            enable          : in     std_logic;                     -- I2c start    (S)
            addr_i          : in     std_logic_vector(7 downto 0);  -- Address Tx: 7 bit - always '1', 0 bit - R/W ('0' - write, '1' - read)
            data_i          : in     std_logic_vector(7 downto 0);  -- Data Tx
            data_o          : out    std_logic_vector(7 downto 0);  -- Data Rx
            data_v          : out    std_logic;                     -- Valid Rx

            ready           : out    std_logic;                     -- Ready
            -- serial interface
            --ds_data           : inout  std_logic;                     -- serial data
            ds_data_i       : in     std_logic;                     -- Serial data input
            ds_data_o       : out    std_logic;                     -- Serial data output
            ds_data_t       : out    std_logic;                     -- Serial data enable
            ds_clk          : out    std_logic;                     -- Serial clock
            ds_ena          : out    std_logic                      -- Clock enable for i2c
            );
    end component;

    component cl_timer_data is
        generic (
            TIME_SECS   : in integer range 0 to 59:=12;         -- Seconds
            TIME_MINS   : in integer range 0 to 59:=35;         -- Minutes
            TIME_HRS    : in integer range 0 to 23:=17;         -- Hours
            TIME_DTS    : in integer range 0 to 30:=13;         -- Dates
            TIME_MTHS   : in integer range 0 to 11:=07;         -- Months
            TIME_DAYS   : in integer range 0 to 59:=17;         -- Days
            TIME_YRS    : in integer range 0 to 99:=86;         -- Years
            TD          : in time                               -- simulation time
        );
        port(
            ---- Global signals ----
            reset       :  in   std_logic;                      -- asycnchronous reset
            clk         :  in   std_logic;                      -- clock 50 MHz
            restart     :  in   std_logic;                      -- restart timer
            ---- DS1302 signals ----
            addr        :  out  std_logic_vector(7 downto 0);   -- address for timer
            data_o      :  out  std_logic_vector(7 downto 0);   -- input data (to timer)
            data_i      :  in   std_logic_vector(7 downto 0);   -- output data (from timer)
            data_v      :  in   std_logic;                      -- valid data (from timer)
            ready       :  in   std_logic;                      -- timer is ready for data
            enable      :  out  std_logic;                      -- timer enable
            ---- LCD1602 signals ----
            drawing_allowed    :  out  std_logic;                      -- enable writing to LCD RAM
            timer_data         :  out  std_logic_vector(3 downto 0);   -- data to LCD RAM
            timer_addr         :  out  std_logic_vector(4 downto 0)    -- address to LCD RAM
        );
    end component;

    component vga_driver is
        port (
            CLK         : in  STD_LOGIC;
            RST         : in  STD_LOGIC;
           SECONDS   : in   integer;
           MINUTES   : in   integer;
           HOURS     : in   integer;
            HSYNC       : out  STD_LOGIC;
            VSYNC       : out  STD_LOGIC;
            RGB         : out  STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    component digi_clk is
    port (clk1    : in std_logic;
          seconds : out integer;
          minutes : out integer;
          hours   : out integer
        );
    end component;

end ctrl_types_pkg;
