library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity digi_clk is
port (clk1    : in std_logic;
      seconds : out integer;
      minutes : out integer;
      hours   : out integer
    );
end digi_clk;

architecture Behavioral of digi_clk is
signal sec : integer range 0 to 59  := 50;
signal min : integer range 0 to 59  := 59;
signal hour : integer range 0 to 23 := 23;

signal count          : integer := 1;
signal clk            : std_logic := '0';
begin
    seconds <= sec;
    minutes <= min;
    hours   <= hour;

    -- Frequency divider - 100MHz to 1MHz
    process(clk1)
    begin
        if rising_edge(clk1) then
            count <= count + 1;
            if (count = 25000000) then
                clk <= not clk;
                count <= 1;
            end if;
        end if;
    end process;

    process(clk) -- period of clk is 1 second.
    begin
        if rising_edge(clk) then
            if (sec < 59) then
                sec <= sec + 1;
            else
                sec <= 0;
                if (min < 59) then
                    min <= min + 1;
                else
                    min <= 0;
                    if (hour < 23) then
                        hour <= hour + 1;
                    else
                        hour <= 0;
                    end if;
                end if;
            end if;
        end if;
    end process;
end Behavioral;
