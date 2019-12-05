library ieee;
use ieee.std_logic_1164.all;

entity debounce is
    generic (
        clk_freq    : integer := 50_000_000;
        stable_time : integer := 10
    );
    port(
        clk     : in  std_logic;
        reset_n : in  std_logic;
        button  : in  std_logic;
        result  : out std_logic
    );
end debounce;

architecture logic of debounce is
    signal flipflops   : std_logic_vector(1 downto 0);                    -- input flip flops
    signal counter_set : std_logic;                                       -- sync reset to zero
begin
    counter_set <= flipflops(0) xor flipflops(1);                       -- determine when to start/reset counter

    debounce: process(clk, reset_n)
    variable count : integer range 0 to clk_freq * stable_time / 1000;  -- counter for timing
    begin
        if (reset_n = '0') then
            flipflops(1 downto 0) <= "00";
            result <= '0';
        elsif rising_edge(clk) then
            flipflops(0) <= button;
            flipflops(1) <= flipflops(0);
            if (counter_set = '1') then
                count := 0;
            elsif (count < clk_freq * stable_time / 1000) then
                count := count + 1;
            else                                                        -- stable input time is met
                result <= flipflops(1);                                 -- output the stable value
            end if;
        end if;
    end process;
end logic;
