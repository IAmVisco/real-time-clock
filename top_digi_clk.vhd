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
        RED         :  out  STD_LOGIC_VECTOR (4 downto 0);
        GREEN       :  out  STD_LOGIC_VECTOR (5 downto 0);
        BLUE        :  out  STD_LOGIC_VECTOR (4 downto 0)
    );
end top_digi_clk;

architecture Behavioral of top_digi_clk is
signal sec, min, hour : integer range 0 to 60 := 0;
signal half_sec       : std_logic;

begin
    x_DIGI_CLK: digi_clk
        port map (
            clk1         => CLK,
            half_seconds => half_sec,
            seconds      => sec,
            minutes      => min,
            hours        => hour
        );

    x_VGA_DATA: vga_driver
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
