library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_driver is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           HSYNC : out  STD_LOGIC;
           VSYNC : out  STD_LOGIC;
           RGB : out  STD_LOGIC_VECTOR (2 downto 0)
        );
end vga_driver;

architecture Behavioral of vga_driver is
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
	 
	 signal h1seg : std_logic_vector (6 downto 0) := "0000000";
	 signal h2seg : std_logic_vector (6 downto 0) := "0000000";	
	 signal m1seg : std_logic_vector (6 downto 0) := "0000000";	
	 signal m2seg : std_logic_vector (6 downto 0) := "0000000";	
	 signal s1seg : std_logic_vector (6 downto 0) := "0000000";	
	 signal s2seg : std_logic_vector (6 downto 0) := "0000000";	

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
					elsif (s2seg(0) = '1' AND Vpos >= segS2Ypos AND Vpos <= segS2pos + SegSize1) AND (Hpos >= segS2Xpos AND Hpos <= segS2Xpos + SegWidth) then  -- segA S2
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

end Behavioral;

