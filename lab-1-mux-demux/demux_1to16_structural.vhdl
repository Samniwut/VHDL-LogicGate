library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEMUX_1to16_STRUCTURAL is
    Port (
        D : in STD_LOGIC;                       -- 1 input line
        S : in STD_LOGIC_VECTOR(3 downto 0);   -- 4 select lines
        Y : out STD_LOGIC_VECTOR(15 downto 0)  -- 16 output lines
    );
end DEMUX_1to16_STRUCTURAL;

architecture Structural of DEMUX_1to16_STRUCTURAL is
    -- Intermediate signals
    signal S_not : STD_LOGIC_VECTOR(3 downto 0);  -- NOT of select lines

begin
    -- NOT gates for select lines
    S_not(0) <= not S(0);
    S_not(1) <= not S(1);
    S_not(2) <= not S(2);
    S_not(3) <= not S(3);

    -- AND gates for each output
    -- Each output is AND of input signal with decoder logic

    -- Y0: D AND S3' AND S2' AND S1' AND S0'
    Y(0) <= D and S_not(3) and S_not(2) and S_not(1) and S_not(0);

    -- Y1: D AND S3' AND S2' AND S1' AND S0
    Y(1) <= D and S_not(3) and S_not(2) and S_not(1) and S(0);

    -- Y2: D AND S3' AND S2' AND S1 AND S0'
    Y(2) <= D and S_not(3) and S_not(2) and S(1) and S_not(0);

    -- Y3: D AND S3' AND S2' AND S1 AND S0
    Y(3) <= D and S_not(3) and S_not(2) and S(1) and S(0);

    -- Y4: D AND S3' AND S2 AND S1' AND S0'
    Y(4) <= D and S_not(3) and S(2) and S_not(1) and S_not(0);

    -- Y5: D AND S3' AND S2 AND S1' AND S0
    Y(5) <= D and S_not(3) and S(2) and S_not(1) and S(0);

    -- Y6: D AND S3' AND S2 AND S1 AND S0'
    Y(6) <= D and S_not(3) and S(2) and S(1) and S_not(0);

    -- Y7: D AND S3' AND S2 AND S1 AND S0
    Y(7) <= D and S_not(3) and S(2) and S(1) and S(0);

    -- Y8: D AND S3 AND S2' AND S1' AND S0'
    Y(8) <= D and S(3) and S_not(2) and S_not(1) and S_not(0);

    -- Y9: D AND S3 AND S2' AND S1' AND S0
    Y(9) <= D and S(3) and S_not(2) and S_not(1) and S(0);

    -- Y10: D AND S3 AND S2' AND S1 AND S0'
    Y(10) <= D and S(3) and S_not(2) and S(1) and S_not(0);

    -- Y11: D AND S3 AND S2' AND S1 AND S0
    Y(11) <= D and S(3) and S_not(2) and S(1) and S(0);

    -- Y12: D AND S3 AND S2 AND S1' AND S0'
    Y(12) <= D and S(3) and S(2) and S_not(1) and S_not(0);

    -- Y13: D AND S3 AND S2 AND S1' AND S0
    Y(13) <= D and S(3) and S(2) and S_not(1) and S(0);

    -- Y14: D AND S3 AND S2 AND S1 AND S0'
    Y(14) <= D and S(3) and S(2) and S(1) and S_not(0);

    -- Y15: D AND S3 AND S2 AND S1 AND S0
    Y(15) <= D and S(3) and S(2) and S(1) and S(0);

end Structural;
