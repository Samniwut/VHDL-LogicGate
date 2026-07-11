-- =============================================================
-- 1:16 Demultiplexer using AND Gates
-- For EDA Playground
-- =============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEMUX_1to16_GATES is
    Port (
        D : in STD_LOGIC;                       -- 1 input line
        S : in STD_LOGIC_VECTOR(3 downto 0);   -- 4 select lines (S3 S2 S1 S0)
        Y : out STD_LOGIC_VECTOR(15 downto 0)  -- 16 output lines
    );
end DEMUX_1to16_GATES;

architecture Structural of DEMUX_1to16_GATES is
    -- Signals for NOT gates (inverted select lines)
    signal S_not : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- ===== NOT GATES =====
    S_not(0) <= not S(0);
    S_not(1) <= not S(1);
    S_not(2) <= not S(2);
    S_not(3) <= not S(3);

    -- ===== 16 AND GATES (5-input each) =====
    -- Each output: D AND (decoder logic for that output)

    Y(0)  <= D and S_not(3) and S_not(2) and S_not(1) and S_not(0);
    Y(1)  <= D and S_not(3) and S_not(2) and S_not(1) and S(0);
    Y(2)  <= D and S_not(3) and S_not(2) and S(1) and S_not(0);
    Y(3)  <= D and S_not(3) and S_not(2) and S(1) and S(0);
    Y(4)  <= D and S_not(3) and S(2) and S_not(1) and S_not(0);
    Y(5)  <= D and S_not(3) and S(2) and S_not(1) and S(0);
    Y(6)  <= D and S_not(3) and S(2) and S(1) and S_not(0);
    Y(7)  <= D and S_not(3) and S(2) and S(1) and S(0);
    Y(8)  <= D and S(3) and S_not(2) and S_not(1) and S_not(0);
    Y(9)  <= D and S(3) and S_not(2) and S_not(1) and S(0);
    Y(10) <= D and S(3) and S_not(2) and S(1) and S_not(0);
    Y(11) <= D and S(3) and S_not(2) and S(1) and S(0);
    Y(12) <= D and S(3) and S(2) and S_not(1) and S_not(0);
    Y(13) <= D and S(3) and S(2) and S_not(1) and S(0);
    Y(14) <= D and S(3) and S(2) and S(1) and S_not(0);
    Y(15) <= D and S(3) and S(2) and S(1) and S(0);

end Structural;
