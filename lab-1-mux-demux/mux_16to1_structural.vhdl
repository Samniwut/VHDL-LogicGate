library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_16to1_STRUCTURAL is
    Port (
        D : in STD_LOGIC_VECTOR(15 downto 0);  -- 16 input lines
        S : in STD_LOGIC_VECTOR(3 downto 0);   -- 4 select lines
        Y : out STD_LOGIC                        -- 1 output line
    );
end MUX_16to1_STRUCTURAL;

architecture Structural of MUX_16to1_STRUCTURAL is
    -- Intermediate signals
    signal S_not : STD_LOGIC_VECTOR(3 downto 0);  -- NOT of select lines
    signal and_out : STD_LOGIC_VECTOR(15 downto 0);  -- outputs from AND gates

begin
    -- NOT gates for select lines
    S_not(0) <= not S(0);
    S_not(1) <= not S(1);
    S_not(2) <= not S(2);
    S_not(3) <= not S(3);

    -- AND gates for each input
    -- Each AND gate takes 1 input line and 4 select lines (some inverted)

    -- Y0: D0 AND S3' AND S2' AND S1' AND S0'
    and_out(0) <= D(0) and S_not(3) and S_not(2) and S_not(1) and S_not(0);

    -- Y1: D1 AND S3' AND S2' AND S1' AND S0
    and_out(1) <= D(1) and S_not(3) and S_not(2) and S_not(1) and S(0);

    -- Y2: D2 AND S3' AND S2' AND S1 AND S0'
    and_out(2) <= D(2) and S_not(3) and S_not(2) and S(1) and S_not(0);

    -- Y3: D3 AND S3' AND S2' AND S1 AND S0
    and_out(3) <= D(3) and S_not(3) and S_not(2) and S(1) and S(0);

    -- Y4: D4 AND S3' AND S2 AND S1' AND S0'
    and_out(4) <= D(4) and S_not(3) and S(2) and S_not(1) and S_not(0);

    -- Y5: D5 AND S3' AND S2 AND S1' AND S0
    and_out(5) <= D(5) and S_not(3) and S(2) and S_not(1) and S(0);

    -- Y6: D6 AND S3' AND S2 AND S1 AND S0'
    and_out(6) <= D(6) and S_not(3) and S(2) and S(1) and S_not(0);

    -- Y7: D7 AND S3' AND S2 AND S1 AND S0
    and_out(7) <= D(7) and S_not(3) and S(2) and S(1) and S(0);

    -- Y8: D8 AND S3 AND S2' AND S1' AND S0'
    and_out(8) <= D(8) and S(3) and S_not(2) and S_not(1) and S_not(0);

    -- Y9: D9 AND S3 AND S2' AND S1' AND S0
    and_out(9) <= D(9) and S(3) and S_not(2) and S_not(1) and S(0);

    -- Y10: D10 AND S3 AND S2' AND S1 AND S0'
    and_out(10) <= D(10) and S(3) and S_not(2) and S(1) and S_not(0);

    -- Y11: D11 AND S3 AND S2' AND S1 AND S0
    and_out(11) <= D(11) and S(3) and S_not(2) and S(1) and S(0);

    -- Y12: D12 AND S3 AND S2 AND S1' AND S0'
    and_out(12) <= D(12) and S(3) and S(2) and S_not(1) and S_not(0);

    -- Y13: D13 AND S3 AND S2 AND S1' AND S0
    and_out(13) <= D(13) and S(3) and S(2) and S_not(1) and S(0);

    -- Y14: D14 AND S3 AND S2 AND S1 AND S0'
    and_out(14) <= D(14) and S(3) and S(2) and S(1) and S_not(0);

    -- Y15: D15 AND S3 AND S2 AND S1 AND S0
    and_out(15) <= D(15) and S(3) and S(2) and S(1) and S(0);

    -- OR gate: combine all AND outputs
    Y <= and_out(0) or and_out(1) or and_out(2) or and_out(3) or
         and_out(4) or and_out(5) or and_out(6) or and_out(7) or
         and_out(8) or and_out(9) or and_out(10) or and_out(11) or
         and_out(12) or and_out(13) or and_out(14) or and_out(15);

end Structural;
