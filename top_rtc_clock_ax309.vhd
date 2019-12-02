-- SW<0> - RESET
-- SW<1> - ENABLE
-- SW<3> - START

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

use work.ctrl_types_pkg.all;

entity top_rtc_clock_ax309 is
    generic (
        TD              : in time    := 1 ns; --! simulation time;
        DIV_SCL         : in integer := 100   --! clock division for logic counters
    );
    port(
        ---- SWITCHES ----
        RESET       :  in   std_logic;  --! asycnchronous reset: SW(1)
        RESTART     :  in   std_logic;  --! RESTART Timer DS1302 SW(2)
        ---- CLOCK 50 MHz ----
        CLK         :  in   std_logic;  --! main clock 50 MHz
        ---- VGA SYNC ----
        VGA_HSYNC   :  out  std_logic;  --! horiztonal sync
        VGA_VSYNC   :  out  std_logic;  --! vertical sync
        RGB         :  out  STD_LOGIC_VECTOR (2 downto 0);
        --VGA_R       :  out  std_logic;  --! VGA Red
        --VGA_G       :  out  std_logic;  --! VGA Green
        --VGA_B       :  out  std_logic;  --! VGA Blue
        ---- SERIAL TIMER ----
        T_DT        : inout std_logic;  --! timer serial data
        T_CK        : out   std_logic;  --! timer serial clock (~1 MHz)
        T_CE        : out   std_logic   --! timer serial enable
    );
end top_rtc_clock_ax309;

architecture top_rtc_clock_ax309 of top_rtc_clock_ax309 is

---------------- SIGNALS DECLARATION ----------------
--signal reset_v      : std_logic_vector(6 downto 0);
--signal rst          : std_logic;

-- VGA
--signal RGB          : std_logic_vector(2 downto 0);
signal vSync, hSync : std_logic;

--signal CLK       : std_logic;


signal time_addr    : std_logic_vector(7 downto 0);
signal time_data_i  : std_logic_vector(7 downto 0);
signal time_data_o  : std_logic_vector(7 downto 0);
signal time_data_v  : std_logic;
signal time_rdy     : std_logic;
signal time_enable  : std_logic;

--signal rstart       : std_logic;

signal ds_data_i    : std_logic;
signal ds_data_o    : std_logic;
signal ds_data_t    : std_logic;
signal ds_data_tn   : std_logic;

signal load_ena     : std_logic;
signal load_dat     : std_logic_vector(3 downto 0);
signal load_addr    : std_logic_vector(4 downto 0);

begin
    ---------------- TIMER TRANSFER ----------------
    x_SET_TIME: cl_timer_data
        generic map (
            TIME_SECS   => 00,              -- seconds
            TIME_MINS   => 30,              -- minutes
            TIME_HRS    => 19,              -- hours
            TIME_DTS    => 02,              -- dates
            TIME_MTHS   => 11,              -- months
            TIME_DAYS   => 01,              -- days
            TIME_YRS    => 19,              -- years
            TD          => TD               -- simulation time;
        )
        port map(
            ---- Global signals ----
            reset       => RESET,      -- asycnchronous reset
            clk         => CLK,          -- clock 50 MHz
            restart     => RESTART,          -- restart timer
            ---- DS1302 signals ----
            addr        => time_addr,       -- address for timer
            data_o      => time_data_i,     -- input data (to timer)
            data_i      => time_data_o,     -- output data (from timer)
            data_v      => time_data_v,     -- valid data (from timer)
            ready       => time_rdy,        -- timer is ready for data
            enable      => time_enable,     -- timer enable
            ---- LCD/VGA data signals ----
            drawing_allowed    => load_ena,        -- enables writing
            timer_data         => load_dat,        -- data
            timer_addr         => load_addr        -- address
        );
    ---------------- DS1302 CONTROLLER ----------------
    x_DS1302: rtl_ds1302
        generic map (
            TD          => TD,              -- simulation time;
            DIV_SCL     => DIV_SCL          -- clock division for SCL: clk50m/DIV_SCL
            )
        port map(
            -- global ports
            clk50m          => CLK,      -- system frequency (50 MHz)
            rstn            => RESET,  -- '0' - negative reset
            -- main interface
            enable          => time_enable, -- i2c start    (S)
            addr_i          => time_addr,   -- address Tx: 7 bit - always '1', 0 bit - R/W ('0' - write, '1' - read)
            data_i          => time_data_i, -- data Tx
            data_o          => time_data_o, -- data Rx
            data_v          => time_data_v, -- valid Rx

            ready           => time_rdy,    -- ready
            -- serial interface
            --ds_data       => T_DT,--ds_data,  -- serial data
            ds_data_i       => ds_data_i,   -- serial data input
            ds_data_o       => ds_data_o,   -- serial data output
            ds_data_t       => ds_data_t,   -- serial data enable

            ds_clk          => T_CK,        -- serial clock
            ds_ena          => T_CE         -- clock enable for i2c
        );

    --------------------- VGA Driver -------------------
    x_VGA_DATA: vga_driver
        port map (
            RST        => RESET,
            CLK        => CLK,
            DATA       => load_dat,
            ADDRESS    => load_addr,
            HSYNC      => VGA_HSYNC,
            VSYNC      => VGA_VSYNC,
            RGB        => RGB
        );

    ds_data_tn <= ds_data_t;

    ---------------- I/O BUFFERS ----------------
    --xCLKIN: ibufg port map(i => CLK, o => CLK);
    xDSIO: iobuf port map(i => ds_data_o,  o => ds_data_i, io => T_DT, t => ds_data_tn); --  FIXME

    --xRESET: ibuf port map(i => RESET, o => rst);
    --xSTART: ibuf port map(i => START, o => disp_start);
    --xRESTART: ibuf port map(i => RESTART, o => RESTART);

    --xVGA_vSync: obuf port map(i => vSync, o => VGA_VSYNC);
    --xVGA_hSync: obuf port map(i => hSync, o => VGA_HSYNC);

    --xVGA_R: obuf port map(i => RGB(2), o => VGA_R);
    --xVGA_G: obuf port map(i => RGB(1), o => VGA_G);
    --xVGA_B: obuf port map(i => RGB(0), o => VGA_B);

end top_rtc_clock_ax309;
