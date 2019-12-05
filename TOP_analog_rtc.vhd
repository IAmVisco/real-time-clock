library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

use work.ctrl_types_pkg.all;

entity top_digi_clk is
    port (
        ---- SWITCHES ----
        INC_HOUR    :  in   std_logic;
        INC_MIN     :  in   std_logic;
        ---- CLOCK 50 MHz ----
        CLK         :  in   std_logic;  --! main clock 50 MHz
        ---- VGA SYNC ----
        VGA_HSYNC   :  out  std_logic;  --! horiztonal sync
        VGA_VSYNC   :  out  std_logic;  --! vertical sync
        RED         :  out  STD_LOGIC_VECTOR (4 downto 0);
        GREEN       :  out  STD_LOGIC_VECTOR (4 downto 0);
        BLUE        :  out  STD_LOGIC_VECTOR (4 downto 0)
    );
end top_digi_clk;

architecture Behavioral of top_digi_clk is
signal sec, min, hour      : integer range 0 to 60 := 0;
signal half_sec            : std_logic;
signal RESET               : std_logic := '0';
signal reset_n             : std_logic;
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

end Behavioral;
