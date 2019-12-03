library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_driver is
    Port ( CLK       : in   STD_LOGIC;
           RST       : in   STD_LOGIC;
           SECONDS   : in   integer;
           MINUTES   : in   integer;
           HOURS     : in   integer;
           HSYNC     : out  STD_LOGIC;
           VSYNC     : out  STD_LOGIC;
           RGB       : out  STD_LOGIC_VECTOR (2 downto 0)
        );
end vga_driver;

architecture vga_driver of vga_driver is
    signal clk25 : std_logic := '0';

    constant HD  : integer := 639; --  639   Horizontal Display (640)
    constant HFP : integer := 16;  --   16   Right border (front porch)
    constant HSP : integer := 96;  --   96   Sync pulse (Retrace)
    constant HBP : integer := 48;  --   48   Left boarder (back porch)

    constant VD  : integer := 479;  --  479   Vertical Display (480)
    constant VFP : integer := 10;   --   10   Right border (front porch)
    constant VSP : integer := 2;    --    2   Sync pulse (Retrace)
    constant VBP : integer := 33;   --   33   Left boarder (back porch)

    signal hPos : integer := 0;
    signal vPos : integer := 0;

    signal videoOn : std_logic := '0';

    constant SegWidth : integer := 32;
    constant SegSize1 : integer := SegWidth / 6;
    constant SegSize2 : integer := SegWidth + (SegSize1/2);

    --h1
    constant SegH1Xpos : integer := 10;
    constant SegH1Ypos : integer := 10;

    --h2
    constant SegH2Xpos : integer := 50;
    constant SegH2Ypos : integer := 10;

    --m1
    constant SegM1Xpos : integer := 90;
    constant SegM1Ypos : integer := 10;

    --m2
    constant SegM2Xpos : integer := 130;
    constant SegM2Ypos : integer := 10;

    --s1
    constant SegS1Xpos : integer := 170;
    constant SegS1Ypos : integer := 10;

    --s2
    constant SegS2Xpos : integer := 210;
    constant SegS2Ypos : integer := 10;

    signal h1seg : std_logic_vector (6 downto 0) := "1111111";
    signal h2seg : std_logic_vector (6 downto 0) := "0000001";
    signal m1seg : std_logic_vector (6 downto 0) := "0010000";
    signal m2seg : std_logic_vector (6 downto 0) := "0000000";
    signal s1seg : std_logic_vector (6 downto 0) := "0000100";
    signal s2seg : std_logic_vector (6 downto 0) := "0000000";

    signal zero  : std_logic_vector (6 downto 0) := "0111111";
    signal one   : std_logic_vector (6 downto 0) := "0000110";
    signal two   : std_logic_vector (6 downto 0) := "1011011";
    signal three : std_logic_vector (6 downto 0) := "1001111";
    signal four  : std_logic_vector (6 downto 0) := "1100110";
    signal five  : std_logic_vector (6 downto 0) := "1101101";
    signal six   : std_logic_vector (6 downto 0) := "1111101";
    signal seven : std_logic_vector (6 downto 0) := "0000111";
    signal eight : std_logic_vector (6 downto 0) := "1111111";
    signal nine  : std_logic_vector (6 downto 0) := "1101111";

begin
    clk_div: process(CLK)
    begin
        if rising_edge(CLK) then
            clk25 <= not clk25;
        end if;
    end process;

    Horizontal_position_counter: process(clk25, RST)
    begin
        if (RST = '1') then
            hPos <= 0;
        elsif rising_edge(clk25) then
            if (hPos = (HD + HFP + HSP + HBP)) then
                hPos <= 0;
            else
                hPos <= hPos + 1;
            end if;
        end if;
    end process;

    Vertical_position_counter: process(clk25, RST, hPos)
    begin
        if (RST = '1') then
            vPos <= 0;
        elsif rising_edge(clk25) then
            if (hPos = (HD + HFP + HSP + HBP)) then
                if (vPos = (VD + VFP + VSP + VBP)) then
                    vPos <= 0;
                else
                    vPos <= vPos + 1;
                end if;
            end if;
        end if;
    end process;

    Horizontal_Synchronisation: process(clk25, RST, hPos)
    begin
        if (RST = '1') then
            HSYNC <= '0';
        elsif rising_edge(clk25) then
            if ((hPos <= (HD + HFP)) OR (hPos > HD + HFP + HSP)) then
                HSYNC <= '1';
            else
                HSYNC <= '0';
            end if;
        end if;
    end process;

    Vertical_Synchronisation: process(clk25, RST, vPos)
    begin
        if (RST = '1') then
            VSYNC <= '0';
        elsif rising_edge(clk25) then
            if ((vPos <= (VD + VFP)) OR (vPos > VD + VFP + VSP)) then
                VSYNC <= '1';
            else
                VSYNC <= '0';
            end if;
        end if;
    end process;

    video_on: process(clk25, RST, hPos, vPos)
    begin
        if (RST = '1') then
            videoOn <= '0';
        elsif rising_edge(clk25) then
            if (hPos <= HD and vPos <= VD) then
                videoOn <= '1';
            else
                videoOn <= '0';
            end if;
        end if;
    end process;

    DATA_to_segment: process(clk25, RST, SECONDS, MINUTES, HOURS)
    begin
        if (RST = '1') then
            h1seg <= "0000000";
            h2seg <= "0000000";
            m1seg <= "0000000";
            m2seg <= "0000000";
            s1seg <= "0000000";
            s2seg <= "0000000";
        elsif rising_edge(clk25) then
            case SECONDS is
                when 0 =>
                    s1seg <= zero;
                    s2seg <= zero;
                when 1 =>
                    s1seg <= zero;
                    s2seg <= one;
                when 2 =>
                    s1seg <= zero;
                    s2seg <= two;
                when 3 =>
                    s1seg <= zero;
                    s2seg <= three;
                when 4 =>
                    s1seg <= zero;
                    s2seg <= four;
                when 5 =>
                    s1seg <= zero;
                    s2seg <= five;
                when 6 =>
                    s1seg <= zero;
                    s2seg <= six;
                when 7 =>
                    s1seg <= zero;
                    s2seg <= seven;
                when 8 =>
                    s1seg <= zero;
                    s2seg <= eight;
                when 9 =>
                    s1seg <= zero;
                    s2seg <= nine;
                when 10 =>
                    s1seg <= one;
                    s2seg <= zero;
                when 11 =>
                    s1seg <= one;
                    s2seg <= one;
                when 12 =>
                    s1seg <= one;
                    s2seg <= two;
                when 13 =>
                    s1seg <= one;
                    s2seg <= three;
                when 14 =>
                    s1seg <= one;
                    s2seg <= four;
                when 15 =>
                    s1seg <= one;
                    s2seg <= five;
                when 16 =>
                    s1seg <= one;
                    s2seg <= six;
                when 17 =>
                    s1seg <= one;
                    s2seg <= seven;
                when 18 =>
                    s1seg <= one;
                    s2seg <= eight;
                when 19 =>
                    s1seg <= one;
                    s2seg <= nine;
                when 20 =>
                    s1seg <= zero;
                    s2seg <= zero;
                when 21 =>
                    s1seg <= two;
                    s2seg <= zero;
                when 22 =>
                    s1seg <= two;
                    s2seg <= two;
                when 23 =>
                    s1seg <= two;
                    s2seg <= three;
                when 24 =>
                    s1seg <= two;
                    s2seg <= four;
                when 25 =>
                    s1seg <= two;
                    s2seg <= five;
                when 26 =>
                    s1seg <= two;
                    s2seg <= six;
                when 27 =>
                    s1seg <= two;
                    s2seg <= seven;
                when 28 =>
                    s1seg <= two;
                    s2seg <= eight;
                when 29 =>
                    s1seg <= two;
                    s2seg <= nine;
                when 30 =>
                    s1seg <= zero;
                    s2seg <= zero;
                when 31 =>
                    s1seg <= three;
                    s2seg <= zero;
                when 32 =>
                    s1seg <= three;
                    s2seg <= two;
                when 33 =>
                    s1seg <= three;
                    s2seg <= three;
                when 34 =>
                    s1seg <= three;
                    s2seg <= four;
                when 35 =>
                    s1seg <= three;
                    s2seg <= five;
                when 36 =>
                    s1seg <= three;
                    s2seg <= six;
                when 37 =>
                    s1seg <= three;
                    s2seg <= seven;
                when 38 =>
                    s1seg <= three;
                    s2seg <= eight;
                when 39 =>
                    s1seg <= three;
                    s2seg <= nine;
                when 40 =>
                    s1seg <= four;
                    s2seg <= zero;
                when 41 =>
                    s1seg <= four;
                    s2seg <= zero;
                when 42 =>
                    s1seg <= four;
                    s2seg <= two;
                when 43 =>
                    s1seg <= four;
                    s2seg <= three;
                when 44 =>
                    s1seg <= four;
                    s2seg <= four;
                when 45 =>
                    s1seg <= four;
                    s2seg <= five;
                when 46 =>
                    s1seg <= four;
                    s2seg <= six;
                when 47 =>
                    s1seg <= four;
                    s2seg <= seven;
                when 48 =>
                    s1seg <= four;
                    s2seg <= eight;
                when 49 =>
                    s1seg <= four;
                    s2seg <= nine;
                when 50 =>
                    s1seg <= five;
                    s2seg <= zero;
                when 51 =>
                    s1seg <= five;
                    s2seg <= zero;
                when 52 =>
                    s1seg <= five;
                    s2seg <= two;
                when 53 =>
                    s1seg <= five;
                    s2seg <= three;
                when 54 =>
                    s1seg <= five;
                    s2seg <= four;
                when 55 =>
                    s1seg <= five;
                    s2seg <= five;
                when 56 =>
                    s1seg <= five;
                    s2seg <= six;
                when 57 =>
                    s1seg <= five;
                    s2seg <= seven;
                when 58 =>
                    s1seg <= five;
                    s2seg <= eight;
                when 59 =>
                    s1seg <= five;
                    s2seg <= nine;
                when others =>
                    s1seg <= "0000000";
                    s2seg <= "0000000";
                end case;
            case MINUTES is
                when 0 =>
                    m1seg <= zero;
                    m2seg <= zero;
                when 1 =>
                    m1seg <= zero;
                    m2seg <= one;
                when 2 =>
                    m1seg <= zero;
                    m2seg <= two;
                when 3 =>
                    m1seg <= zero;
                    m2seg <= three;
                when 4 =>
                    m1seg <= zero;
                    m2seg <= four;
                when 5 =>
                    m1seg <= zero;
                    m2seg <= five;
                when 6 =>
                    m1seg <= zero;
                    m2seg <= six;
                when 7 =>
                    m1seg <= zero;
                    m2seg <= seven;
                when 8 =>
                    m1seg <= zero;
                    m2seg <= eight;
                when 9 =>
                    m1seg <= zero;
                    m2seg <= nine;
                when 10 =>
                    m1seg <= one;
                    m2seg <= zero;
                when 11 =>
                    m1seg <= one;
                    m2seg <= one;
                when 12 =>
                    m1seg <= one;
                    m2seg <= two;
                when 13 =>
                    m1seg <= one;
                    m2seg <= three;
                when 14 =>
                    m1seg <= one;
                    m2seg <= four;
                when 15 =>
                    m1seg <= one;
                    m2seg <= five;
                when 16 =>
                    m1seg <= one;
                    m2seg <= six;
                when 17 =>
                    m1seg <= one;
                    m2seg <= seven;
                when 18 =>
                    m1seg <= one;
                    m2seg <= eight;
                when 19 =>
                    m1seg <= one;
                    m2seg <= nine;
                when 20 =>
                    m1seg <= zero;
                    m2seg <= zero;
                when 21 =>
                    m1seg <= two;
                    m2seg <= zero;
                when 22 =>
                    m1seg <= two;
                    m2seg <= two;
                when 23 =>
                    m1seg <= two;
                    m2seg <= three;
                when 24 =>
                    m1seg <= two;
                    m2seg <= four;
                when 25 =>
                    m1seg <= two;
                    m2seg <= five;
                when 26 =>
                    m1seg <= two;
                    m2seg <= six;
                when 27 =>
                    m1seg <= two;
                    m2seg <= seven;
                when 28 =>
                    m1seg <= two;
                    m2seg <= eight;
                when 29 =>
                    m1seg <= two;
                    m2seg <= nine;
                when 30 =>
                    m1seg <= zero;
                    m2seg <= zero;
                when 31 =>
                    m1seg <= three;
                    m2seg <= zero;
                when 32 =>
                    m1seg <= three;
                    m2seg <= two;
                when 33 =>
                    m1seg <= three;
                    m2seg <= three;
                when 34 =>
                    m1seg <= three;
                    m2seg <= four;
                when 35 =>
                    m1seg <= three;
                    m2seg <= five;
                when 36 =>
                    m1seg <= three;
                    m2seg <= six;
                when 37 =>
                    m1seg <= three;
                    m2seg <= seven;
                when 38 =>
                    m1seg <= three;
                    m2seg <= eight;
                when 39 =>
                    m1seg <= three;
                    m2seg <= nine;
                when 40 =>
                    m1seg <= four;
                    m2seg <= zero;
                when 41 =>
                    m1seg <= four;
                    m2seg <= zero;
                when 42 =>
                    m1seg <= four;
                    m2seg <= two;
                when 43 =>
                    m1seg <= four;
                    m2seg <= three;
                when 44 =>
                    m1seg <= four;
                    m2seg <= four;
                when 45 =>
                    m1seg <= four;
                    m2seg <= five;
                when 46 =>
                    m1seg <= four;
                    m2seg <= six;
                when 47 =>
                    m1seg <= four;
                    m2seg <= seven;
                when 48 =>
                    m1seg <= four;
                    m2seg <= eight;
                when 49 =>
                    m1seg <= four;
                    m2seg <= nine;
                when 50 =>
                    m1seg <= five;
                    m2seg <= zero;
                when 51 =>
                    m1seg <= five;
                    m2seg <= zero;
                when 52 =>
                    m1seg <= five;
                    m2seg <= two;
                when 53 =>
                    m1seg <= five;
                    m2seg <= three;
                when 54 =>
                    m1seg <= five;
                    m2seg <= four;
                when 55 =>
                    m1seg <= five;
                    m2seg <= five;
                when 56 =>
                    m1seg <= five;
                    m2seg <= six;
                when 57 =>
                    m1seg <= five;
                    m2seg <= seven;
                when 58 =>
                    m1seg <= five;
                    m2seg <= eight;
                when 59 =>
                    m1seg <= five;
                    m2seg <= nine;
                when others =>
                    m1seg <= "0000000";
                    m2seg <= "0000000";
                end case;
                case HOURS is
                when 0 =>
                    h1seg <= zero;
                    h2seg <= zero;
                when 1 =>
                    h1seg <= zero;
                    h2seg <= one;
                when 2 =>
                    h1seg <= zero;
                    h2seg <= two;
                when 3 =>
                    h1seg <= zero;
                    h2seg <= three;
                when 4 =>
                    h1seg <= zero;
                    h2seg <= four;
                when 5 =>
                    h1seg <= zero;
                    h2seg <= five;
                when 6 =>
                    h1seg <= zero;
                    h2seg <= six;
                when 7 =>
                    h1seg <= zero;
                    h2seg <= seven;
                when 8 =>
                    h1seg <= zero;
                    h2seg <= eight;
                when 9 =>
                    h1seg <= zero;
                    h2seg <= nine;
                when 10 =>
                    h1seg <= one;
                    h2seg <= zero;
                when 11 =>
                    h1seg <= one;
                    h2seg <= one;
                when 12 =>
                    h1seg <= one;
                    h2seg <= two;
                when 13 =>
                    h1seg <= one;
                    h2seg <= three;
                when 14 =>
                    h1seg <= one;
                    h2seg <= four;
                when 15 =>
                    h1seg <= one;
                    h2seg <= five;
                when 16 =>
                    h1seg <= one;
                    h2seg <= six;
                when 17 =>
                    h1seg <= one;
                    h2seg <= seven;
                when 18 =>
                    h1seg <= one;
                    h2seg <= eight;
                when 19 =>
                    h1seg <= one;
                    h2seg <= nine;
                when 20 =>
                    h1seg <= zero;
                    h2seg <= zero;
                when 21 =>
                    h1seg <= two;
                    h2seg <= zero;
                when 22 =>
                    h1seg <= two;
                    h2seg <= two;
                when 23 =>
                    h1seg <= two;
                    h2seg <= three;
                when others =>
                    h1seg <= "0000000";
                    h2seg <= "0000000";
                end case;
            end if;
    end process;

    draw: process(clk25, RST, hPos, vPos, videoOn)
    begin
        if (RST = '1') then
            RGB <= "000";
        elsif rising_edge(clk25) then
            if (videoOn = '1') then
                if (h1seg(0) = '1' AND Vpos >= segH1Ypos AND Vpos <= segH1Ypos + SegSize1) AND (Hpos >= segH1Xpos AND Hpos <= segH1Xpos + SegWidth) then  -- segA H1
                        RGB <= "110";
                    elsif (h2seg(0) = '1' AND Vpos >= segH2Ypos AND Vpos <= segH2Ypos + SegSize1) AND (Hpos >= segH2Xpos AND Hpos <= segH2Xpos + SegWidth) then  -- segA H2
                            RGB <= "110";
                    elsif (m1seg(0) = '1' AND Vpos >= segM1Ypos AND Vpos <= segM1Ypos + SegSize1) AND (Hpos >= segM1Xpos AND Hpos <= segM1Xpos + SegWidth) then  -- segA M1
                            RGB <= "110";
                    elsif (m2seg(0) = '1' AND Vpos >= segM2Ypos AND Vpos <= segM2Ypos + SegSize1) AND (Hpos >= segM2Xpos AND Hpos <= segM2Xpos + SegWidth) then  -- segA M2
                            RGB <= "110";
                    elsif (s1seg(0) = '1' AND Vpos >= segS1Ypos AND Vpos <= segS1Ypos + SegSize1) AND (Hpos >= segS1Xpos AND Hpos <= segS1Xpos + SegWidth) then  -- segA S1
                            RGB <= "110";
                    elsif (s2seg(0) = '1' AND Vpos >= segS2Ypos AND Vpos <= segS2Ypos + SegSize1) AND (Hpos >= segS2Xpos AND Hpos <= segS2Xpos + SegWidth) then  -- segA S2
                            RGB <= "110";

                    elsif (h1seg(1) = '1' AND Vpos >= segH1Ypos AND Vpos <= segH1Ypos + SegWidth + (SegSize1/2)) AND (Hpos >= segH1Xpos + SegWidth - SegSize1 AND Hpos <= segH1Xpos + SegWidth) then  -- segB H1
                            RGB <= "110";
                    elsif (h2seg(1) = '1' AND Vpos >= segH2Ypos AND Vpos <= segH2Ypos + SegWidth + (SegSize1/2)) AND (Hpos >= segH2Xpos + SegWidth - SegSize1 AND Hpos <= segH2Xpos + SegWidth) then  -- segB H2
                            RGB <= "110";
                    elsif (m1seg(1) = '1' AND Vpos >= segM1Ypos AND Vpos <= segM1Ypos + SegWidth + (SegSize1/2)) AND (Hpos >= segM1Xpos + SegWidth - SegSize1 AND Hpos <= segM1Xpos + SegWidth) then  -- segB M1
                            RGB <= "110";
                    elsif (m2seg(1) = '1' AND Vpos >= segM2Ypos AND Vpos <= segM2Ypos + SegWidth + (SegSize1/2)) AND (Hpos >= segM2Xpos + SegWidth - SegSize1 AND Hpos <= segM2Xpos + SegWidth) then  -- segB M2
                            RGB <= "110";
                    elsif (s1seg(1) = '1' AND Vpos >= segS1Ypos AND Vpos <= segS1Ypos + SegWidth + (SegSize1/2)) AND (Hpos >= segS1Xpos + SegWidth - SegSize1 AND Hpos <= segS1Xpos + SegWidth) then  -- segB S1
                            RGB <= "110";
                    elsif (s2seg(1) = '1' AND Vpos >= segS2Ypos AND Vpos <= segS2Ypos + SegWidth + (SegSize1/2)) AND (Hpos >= segS2Xpos + SegWidth - SegSize1 AND Hpos <= segS2Xpos + SegWidth) then  -- segB S2
                            RGB <= "110";

                    elsif (h1seg(2) = '1' AND Vpos >= segH1Ypos + SegWidth - (SegSize1/2) AND Vpos <= segH1Ypos + (2*SegWidth)) AND (Hpos >= segH1Xpos + SegWidth - SegSize1 AND Hpos <= segH1Xpos + SegWidth) then  -- segC H1
                                RGB <= "110";
                    elsif (h2seg(2) = '1' AND Vpos >= segH2Ypos + SegWidth - (SegSize1/2) AND Vpos <= segH2Ypos + (2*SegWidth)) AND (Hpos >= segH2Xpos + SegWidth - SegSize1 AND Hpos <= segH2Xpos + SegWidth) then  -- segC H2
                                RGB <= "110";
                    elsif (m1seg(2) = '1' AND Vpos >= segM1Ypos + SegWidth - (SegSize1/2) AND Vpos <= segM1Ypos + (2*SegWidth)) AND (Hpos >= segM1Xpos + SegWidth - SegSize1 AND Hpos <= segM1Xpos + SegWidth) then  -- segC M1
                                RGB <= "110";
                    elsif (m2seg(2) = '1' AND Vpos >= segM2Ypos + SegWidth - (SegSize1/2) AND Vpos <= segM2Ypos + (2*SegWidth)) AND (Hpos >= segM2Xpos + SegWidth - SegSize1 AND Hpos <= segM2Xpos + SegWidth) then  -- segC M2
                                RGB <= "110";
                    elsif (s1seg(2) = '1' AND Vpos >= segS1Ypos + SegWidth - (SegSize1/2) AND Vpos <= segS1Ypos + (2*SegWidth)) AND (Hpos >= segS1Xpos + SegWidth - SegSize1 AND Hpos <= segS1Xpos + SegWidth) then  -- segC S1
                                RGB <= "110";
                    elsif (s2seg(2) = '1' AND Vpos >= segS2Ypos + SegWidth - (SegSize1/2) AND Vpos <= segS2Ypos + (2*SegWidth)) AND (Hpos >= segS2Xpos + SegWidth - SegSize1 AND Hpos <= segS2Xpos + SegWidth) then  -- segC S2
                                RGB <= "110";

                    elsif (h1seg(3) = '1' AND Vpos >= segH1Ypos + (2*SegWidth) - SegSize1 AND Vpos <= segH1Ypos + (2*SegWidth)) AND (Hpos >= segH1Xpos AND Hpos <= segH1Xpos + SegWidth) then  -- segD H1
                            RGB <= "110";
                    elsif (h2seg(3) = '1' AND Vpos >= segH2Ypos + (2*SegWidth) - SegSize1 AND Vpos <= segH2Ypos + (2*SegWidth)) AND (Hpos >= segH2Xpos AND Hpos <= segH2Xpos + SegWidth) then  -- segD H2
                            RGB <= "110";
                    elsif (m1seg(3) = '1' AND Vpos >= segM1Ypos + (2*SegWidth) - SegSize1 AND Vpos <= segM1Ypos + (2*SegWidth)) AND (Hpos >= segM1Xpos AND Hpos <= segM1Xpos + SegWidth) then  -- segD M1
                            RGB <= "110";
                    elsif (m2seg(3) = '1' AND Vpos >= segM2Ypos + (2*SegWidth) - SegSize1 AND Vpos <= segM2Ypos + (2*SegWidth)) AND (Hpos >= segM2Xpos AND Hpos <= segM2Xpos + SegWidth) then  -- segD M2
                            RGB <= "110";
                    elsif (s1seg(3) = '1' AND Vpos >= segS1Ypos + (2*SegWidth) - SegSize1 AND Vpos <= segS1Ypos + (2*SegWidth)) AND (Hpos >= segS1Xpos AND Hpos <= segS1Xpos + SegWidth) then  -- segD S1
                            RGB <= "110";
                    elsif (s2seg(3) = '1' AND Vpos >= segS2Ypos + (2*SegWidth) - SegSize1 AND Vpos <= segS2Ypos + (2*SegWidth)) AND (Hpos >= segS2Xpos AND Hpos <= segS2Xpos + SegWidth) then  -- segD S2
                            RGB <= "110";

                    elsif (h1seg(4) = '1' AND Vpos >= segH1Ypos + SegWidth - (SegSize1/2) AND Vpos <= segH1Ypos + (2*SegWidth)) AND (Hpos >= segH1Xpos AND Hpos <= segH1Xpos + SegSize1) then  -- segE H1
                            RGB <= "110";
                    elsif (h2seg(4) = '1' AND Vpos >= segH2Ypos + SegWidth - (SegSize1/2) AND Vpos <= segH2Ypos + (2*SegWidth)) AND (Hpos >= segH2Xpos AND Hpos <= segH2Xpos + SegSize1) then  -- segE H2
                            RGB <= "110";
                    elsif (m1seg(4) = '1' AND Vpos >= segM1Ypos + SegWidth - (SegSize1/2) AND Vpos <= segM1Ypos + (2*SegWidth)) AND (Hpos >= segM1Xpos AND Hpos <= segM1Xpos + SegSize1) then  -- segE M1
                            RGB <= "110";
                    elsif (m2seg(4) = '1' AND Vpos >= segM2Ypos + SegWidth - (SegSize1/2) AND Vpos <= segM2Ypos + (2*SegWidth)) AND (Hpos >= segM2Xpos AND Hpos <= segM2Xpos + SegSize1) then  -- segE M2
                            RGB <= "110";
                    elsif (s1seg(4) = '1' AND Vpos >= segS1Ypos + SegWidth - (SegSize1/2) AND Vpos <= segS1Ypos + (2*SegWidth)) AND (Hpos >= segS1Xpos AND Hpos <= segS1Xpos + SegSize1) then  -- segE S1
                            RGB <= "110";
                    elsif (s2seg(4) = '1' AND Vpos >= segS2Ypos + SegWidth - (SegSize1/2) AND Vpos <= segS2Ypos + (2*SegWidth)) AND (Hpos >= segS2Xpos AND Hpos <= segS2Xpos + SegSize1) then  -- segE S2
                            RGB <= "110";

                    elsif (h1seg(5) = '1' AND Vpos >= segH1Ypos AND Vpos <= segH1Ypos + SegWidth ) AND (Hpos >= segH1Xpos AND Hpos <= segH1Xpos + SegSize1) then  -- segF H1
                            RGB <= "110";
                    elsif (h2seg(5) = '1' AND Vpos >= segH2Ypos AND Vpos <= segH2Ypos + SegWidth ) AND (Hpos >= segH2Xpos AND Hpos <= segH2Xpos + SegSize1) then  -- segF H2
                            RGB <= "110";
                    elsif (m1seg(5) = '1' AND Vpos >= segM1Ypos AND Vpos <= segM1Ypos + SegWidth ) AND (Hpos >= segM1Xpos AND Hpos <= segM1Xpos + SegSize1) then  -- segF M1
                            RGB <= "110";
                    elsif (m2seg(5) = '1' AND Vpos >= segM2Ypos AND Vpos <= segM2Ypos + SegWidth ) AND (Hpos >= segM2Xpos AND Hpos <= segM2Xpos + SegSize1) then  -- segF M2
                            RGB <= "110";
                    elsif (s1seg(5) = '1' AND Vpos >= segS1Ypos AND Vpos <= segS1Ypos + SegWidth ) AND (Hpos >= segS1Xpos AND Hpos <= segS1Xpos + SegSize1) then  -- segF S1
                            RGB <= "110";
                    elsif (s2seg(5) = '1' AND Vpos >= segS2Ypos AND Vpos <= segS2Ypos + SegWidth ) AND (Hpos >= segS2Xpos AND Hpos <= segS2Xpos + SegSize1) then  -- segF S2
                            RGB <= "110";

                    elsif (h1seg(6) = '1' AND Vpos >= segH1Ypos + SegWidth - (SegSize1/2) AND Vpos <= segH1Ypos + SegWidth + (SegSize1/2) ) AND (Hpos >= segH1Xpos AND Hpos <= segH1Xpos + SegWidth) then  -- segG H1
                            RGB <= "110";
                    elsif (h2seg(6) = '1' AND Vpos >= segH2Ypos + SegWidth - (SegSize1/2) AND Vpos <= segH2Ypos + SegWidth + (SegSize1/2) ) AND (Hpos >= segH2Xpos AND Hpos <= segH2Xpos + SegWidth) then  -- segG H2
                            RGB <= "110";
                    elsif (m1seg(6) = '1' AND Vpos >= segM1Ypos + SegWidth - (SegSize1/2) AND Vpos <= segM1Ypos + SegWidth + (SegSize1/2) ) AND (Hpos >= segM1Xpos AND Hpos <= segM1Xpos + SegWidth) then  -- segG M1
                            RGB <= "110";
                    elsif (m2seg(6) = '1' AND Vpos >= segM2Ypos + SegWidth - (SegSize1/2) AND Vpos <= segM2Ypos + SegWidth + (SegSize1/2) ) AND (Hpos >= segM2Xpos AND Hpos <= segM2Xpos + SegWidth) then  -- segG M2
                            RGB <= "110";
                    elsif (s1seg(6) = '1' AND Vpos >= segS1Ypos + SegWidth - (SegSize1/2) AND Vpos <= segS1Ypos + SegWidth + (SegSize1/2) ) AND (Hpos >= segS1Xpos AND Hpos <= segS1Xpos + SegWidth) then  -- segG S1
                            RGB <= "110";
                    elsif (s2seg(6) = '1' AND Vpos >= segS2Ypos + SegWidth - (SegSize1/2) AND Vpos <= segS2Ypos + SegWidth + (SegSize1/2) ) AND (Hpos >= segS2Xpos AND Hpos <= segS2Xpos + SegWidth) then  -- segG S2
                            RGB <= "110";
                    else
                        RGB <= "000";  -- background colour
                    end if;
            else
                RGB <= "000";
            end if;
        end if;
    end process;

end vga_driver;
