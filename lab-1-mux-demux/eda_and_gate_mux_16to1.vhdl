-- =============================================================
-- 16:1 Multiplexer using AND/OR/NOT Gates
-- For EDA Playground
-- =============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_16to1_GATES is
    Port (
        D : in STD_LOGIC_VECTOR(15 downto 0);  -- 16 input lines
        S : in STD_LOGIC_VECTOR(3 downto 0);   -- 4 select lines (S3 S2 S1 S0)
        Y : out STD_LOGIC                        -- 1 output line
    );
end MUX_16to1_GATES;

architecture Structural of MUX_16to1_GATES is
    -- Signals for NOT gates (inverted select lines)
    signal S_not : STD_LOGIC_VECTOR(3 downto 0);

    -- Signals for AND gate outputs
    signal and_out : STD_LOGIC_VECTOR(15 downto 0);

begin
    -- ===== NOT GATES =====
    -- Create inverted select lines
    S_not(0) <= not S(0);  -- NOT S0
    S_not(1) <= not S(1);  -- NOT S1
    S_not(2) <= not S(2);  -- NOT S2
    S_not(3) <= not S(3);  -- NOT S3

    -- ===== 16 AND GATES (5-input each) =====
    -- Each AND gate: D(i) AND (S3:S0 select logic)

    and_out(0)  <= D(0)  and S_not(3) and S_not(2) and S_not(1) and S_not(0);
    and_out(1)  <= D(1)  and S_not(3) and S_not(2) and S_not(1) and S(0);
    and_out(2)  <= D(2)  and S_not(3) and S_not(2) and S(1) and S_not(0);
    and_out(3)  <= D(3)  and S_not(3) and S_not(2) and S(1) and S(0);
    and_out(4)  <= D(4)  and S_not(3) and S(2) and S_not(1) and S_not(0);
    and_out(5)  <= D(5)  and S_not(3) and S(2) and S_not(1) and S(0);
    and_out(6)  <= D(6)  and S_not(3) and S(2) and S(1) and S_not(0);
    and_out(7)  <= D(7)  and S_not(3) and S(2) and S(1) and S(0);
    and_out(8)  <= D(8)  and S(3) and S_not(2) and S_not(1) and S_not(0);
    and_out(9)  <= D(9)  and S(3) and S_not(2) and S_not(1) and S(0);
    and_out(10) <= D(10) and S(3) and S_not(2) and S(1) and S_not(0);
    and_out(11) <= D(11) and S(3) and S_not(2) and S(1) and S(0);
    and_out(12) <= D(12) and S(3) and S(2) and S_not(1) and S_not(0);
    and_out(13) <= D(13) and S(3) and S(2) and S_not(1) and S(0);
    and_out(14) <= D(14) and S(3) and S(2) and S(1) and S_not(0);
    and_out(15) <= D(15) and S(3) and S(2) and S(1) and S(0);

    -- ===== 16-INPUT OR GATE =====
    -- Combine all AND outputs
    Y <= and_out(0) or and_out(1) or and_out(2) or and_out(3) or
         and_out(4) or and_out(5) or and_out(6) or and_out(7) or
         and_out(8) or and_out(9) or and_out(10) or and_out(11) or
         and_out(12) or and_out(13) or and_out(14) or and_out(15);

end Structural;
