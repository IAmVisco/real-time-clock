library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

use work.ctrl_types_pkg.all;

entity top_digi_clk is
    port (
        ---- SWITCHES ----
        RESET       :  in   std_logic;  --! asycnchronous reset: SW(1)
        RESTART     :  in   std_logic;  --! RESTART Timer DS1302 SW(2)
        ---- CLOCK 50 MHz ----
        CLK         :  in   std_logic;  --! main clock 50 MHz
        ---- VGA SYNC ----
        VGA_HSYNC   :  out  std_logic;  --! horiztonal sync
        VGA_VSYNC   :  out  std_logic;  --! vertical sync
        RGB         :  out  STD_LOGIC_VECTOR (2 downto 0);
        ------ TB SIGNALS ----
        LED         : out std_logic
        --SECS        : out integer;
        --MINS        : out integer;
        --HOURS       : out integer
    );
end top_digi_clk;

architecture Behavioral of top_digi_clk is
signal sec, min, hour : integer range 0 to 60 := 0;

begin
    --SECS  <= sec;
    --MINS  <= min;
    --HOURS <= hour;

    x_DIGI_CLK: digi_clk
        port map (
            clk1    => CLK,
            seconds => sec,
            minutes => min,
            hours   => hour
        );

    x_VGA_DATA: vga_driver
        port map (
            RST        => RESET,
            CLK        => CLK,
            SECONDS    => sec,
            MINUTES    => min,
            HOURS      => hour,
            HSYNC      => VGA_HSYNC,
            VSYNC      => VGA_VSYNC,
            RGB        => RGB
        );

end Behavioral;

