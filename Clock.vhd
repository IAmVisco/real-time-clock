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
signal sec, min, hour : integer range 0 to 60 := 0;
signal count          : integer := 1;
signal clk            : std_logic := '0';
begin
    --seconds <= conv_std_logic_vector(sec, 6);
    --minutes <= conv_std_logic_vector(min, 6);
    --hours   <= conv_std_logic_vector(hour,5);

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
            sec <= sec + 1;
            if (sec = 60) then
                sec <= 0;
                min <= min + 1;
                if (min = 60) then
                    hour <= hour + 1;
                    min <= 0;
                    if (hour = 24) then
                        hour <= 0;
                    end if;
                end if;
            end if;
        end if;
    end process;
end Behavioral;
