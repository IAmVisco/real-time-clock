library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

use work.ctrl_types_pkg.all;

entity top_real_time_clock is
    port (
        ---- CLOCK 50 MHz ----
        CLK         :  in   std_logic;
        ---- SWITCHES ----
        RESET       :  in   std_logic;
        INC_HOUR    :  in   std_logic;
        INC_MIN     :  in   std_logic;
        ---- VGA SYNC ----
        VGA_HSYNC   :  out  std_logic;                     --! horiztonal sync
        VGA_VSYNC   :  out  std_logic;                     --! vertical sync
        RED         :  out  STD_LOGIC_VECTOR (4 downto 0);
        GREEN       :  out  STD_LOGIC_VECTOR (4 downto 0);
        BLUE        :  out  STD_LOGIC_VECTOR (4 downto 0)
    );
end top_real_time_clock;

architecture top_real_time_clock of top_real_time_clock is
signal reset_n             : std_logic;

signal half_sec            : std_logic;
signal sec, min, hour      : integer range 0 to 60 := 0;

signal debounced_inc_hour  : std_logic;
signal debounced_inc_min   : std_logic;

begin
    reset_n <= not RESET;

    INC_HOUR_DEBOUCE: debounce
        port map (
            clk      => CLK,
            reset_n  => reset_n,
            button   => INC_HOUR,
            result   => debounced_inc_hour
        );

    INC_MIN_DEBOUCE: debounce
        port map (
            clk      => CLK,
            reset_n  => reset_n,
            button   => INC_MIN,
            result   => debounced_inc_min
        );

    DIGI_RTC_DATA: digi_clk
        port map (
            clk1         => CLK,
            inc_hour     => debounced_inc_hour,
            inc_min      => debounced_inc_min,
            half_seconds => half_sec,
            seconds      => sec,
            minutes      => min,
            hours        => hour
        );

    VGA_DATA: vga_driver
        port map (
            RST         => RESET,
            CLK         => CLK,
            HALF_SECOND => half_sec,
            SECONDS     => sec,
            MINUTES     => min,
            HOURS       => hour,
            HSYNC       => VGA_HSYNC,
            VSYNC       => VGA_VSYNC,
            RED         => RED,
            GREEN       => GREEN,
            BLUE        => BLUE
        );

end top_real_time_clock;
