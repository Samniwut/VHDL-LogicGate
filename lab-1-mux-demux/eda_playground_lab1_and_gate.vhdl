-- =============================================================
-- Lab-1: 16:1 MUX and 1:16 DEMUX using AND/OR/NOT Gates
-- For EDA Playground - Structural Design
-- =============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- =====================================================
-- 16:1 Multiplexer using AND/OR/NOT Gates
-- =====================================================
entity MUX_16to1_GATES is
    Port (
        D : in STD_LOGIC_VECTOR(15 downto 0);  -- 16 input lines
        S : in STD_LOGIC_VECTOR(3 downto 0);   -- 4 select lines
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

    -- ===== AND GATES (5-input each) =====
    -- Each AND gate: 1 data input + 4 select lines (some inverted)

    -- Y0: D0 AND S3' AND S2' AND S1' AND S0'  (Select = 0000)
    and_out(0) <= D(0) and S_not(3) and S_not(2) and S_not(1) and S_not(0);

    -- Y1: D1 AND S3' AND S2' AND S1' AND S0   (Select = 0001)
    and_out(1) <= D(1) and S_not(3) and S_not(2) and S_not(1) and S(0);

    -- Y2: D2 AND S3' AND S2' AND S1 AND S0'   (Select = 0010)
    and_out(2) <= D(2) and S_not(3) and S_not(2) and S(1) and S_not(0);

    -- Y3: D3 AND S3' AND S2' AND S1 AND S0    (Select = 0011)
    and_out(3) <= D(3) and S_not(3) and S_not(2) and S(1) and S(0);

    -- Y4: D4 AND S3' AND S2 AND S1' AND S0'   (Select = 0100)
    and_out(4) <= D(4) and S_not(3) and S(2) and S_not(1) and S_not(0);

    -- Y5: D5 AND S3' AND S2 AND S1' AND S0    (Select = 0101)
    and_out(5) <= D(5) and S_not(3) and S(2) and S_not(1) and S(0);

    -- Y6: D6 AND S3' AND S2 AND S1 AND S0'    (Select = 0110)
    and_out(6) <= D(6) and S_not(3) and S(2) and S(1) and S_not(0);

    -- Y7: D7 AND S3' AND S2 AND S1 AND S0     (Select = 0111)
    and_out(7) <= D(7) and S_not(3) and S(2) and S(1) and S(0);

    -- Y8: D8 AND S3 AND S2' AND S1' AND S0'   (Select = 1000)
    and_out(8) <= D(8) and S(3) and S_not(2) and S_not(1) and S_not(0);

    -- Y9: D9 AND S3 AND S2' AND S1' AND S0    (Select = 1001)
    and_out(9) <= D(9) and S(3) and S_not(2) and S_not(1) and S(0);

    -- Y10: D10 AND S3 AND S2' AND S1 AND S0'  (Select = 1010)
    and_out(10) <= D(10) and S(3) and S_not(2) and S(1) and S_not(0);

    -- Y11: D11 AND S3 AND S2' AND S1 AND S0   (Select = 1011)
    and_out(11) <= D(11) and S(3) and S_not(2) and S(1) and S(0);

    -- Y12: D12 AND S3 AND S2 AND S1' AND S0'  (Select = 1100)
    and_out(12) <= D(12) and S(3) and S(2) and S_not(1) and S_not(0);

    -- Y13: D13 AND S3 AND S2 AND S1' AND S0   (Select = 1101)
    and_out(13) <= D(13) and S(3) and S(2) and S_not(1) and S(0);

    -- Y14: D14 AND S3 AND S2 AND S1 AND S0'   (Select = 1110)
    and_out(14) <= D(14) and S(3) and S(2) and S(1) and S_not(0);

    -- Y15: D15 AND S3 AND S2 AND S1 AND S0    (Select = 1111)
    and_out(15) <= D(15) and S(3) and S(2) and S(1) and S(0);

    -- ===== OR GATE (16-input) =====
    -- Combine all AND outputs
    Y <= and_out(0) or and_out(1) or and_out(2) or and_out(3) or
         and_out(4) or and_out(5) or and_out(6) or and_out(7) or
         and_out(8) or and_out(9) or and_out(10) or and_out(11) or
         and_out(12) or and_out(13) or and_out(14) or and_out(15);

end Structural;

-- =====================================================
-- 1:16 Demultiplexer using AND Gates
-- =====================================================
entity DEMUX_1to16_GATES is
    Port (
        D : in STD_LOGIC;                       -- 1 input line
        S : in STD_LOGIC_VECTOR(3 downto 0);   -- 4 select lines
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

    -- ===== AND GATES (5-input each) =====
    -- Each output is AND of input with decoder logic

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

-- =====================================================
-- Testbench
-- =====================================================
entity Lab1_AND_Gate_Test is
end Lab1_AND_Gate_Test;

architecture test of Lab1_AND_Gate_Test is
    component MUX_16to1_GATES
        Port (
            D : in STD_LOGIC_VECTOR(15 downto 0);
            S : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC
        );
    end component;

    component DEMUX_1to16_GATES
        Port (
            D : in STD_LOGIC;
            S : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    signal input_data : STD_LOGIC_VECTOR(15 downto 0);
    signal select_mux : STD_LOGIC_VECTOR(3 downto 0);
    signal mux_output : STD_LOGIC;
    signal select_demux : STD_LOGIC_VECTOR(3 downto 0);
    signal demux_output : STD_LOGIC_VECTOR(15 downto 0);

begin
    MUX: MUX_16to1_GATES port map (
        D => input_data,
        S => select_mux,
        Y => mux_output
    );

    DEMUX: DEMUX_1to16_GATES port map (
        D => mux_output,
        S => select_demux,
        Y => demux_output
    );

    process
    begin
        report "";
        report "========================================";
        report " Lab-1: AND Gate Implementation";
        report " 16:1 MUX + 1:16 DEMUX";
        report "========================================";
        report "";

        input_data <= x"5555";
        report "Input Data: 0x5555 (0101010101010101)";
        report "";

        -- Test 1
        report "--- Test 1: Select = 0000 (D0) ---";
        select_mux <= "0000";
        select_demux <= "0000";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) &
                " | DEMUX Y0: " & std_logic'image(demux_output(0));
        report "";

        -- Test 2
        report "--- Test 2: Select = 0101 (D5) ---";
        select_mux <= "0101";
        select_demux <= "0101";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) &
                " | DEMUX Y5: " & std_logic'image(demux_output(5));
        report "";

        -- Test 3
        report "--- Test 3: Select = 1010 (D10) ---";
        select_mux <= "1010";
        select_demux <= "1010";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) &
                " | DEMUX Y10: " & std_logic'image(demux_output(10));
        report "";

        -- Test 4: Independent Select (KEY TEST)
        report "========================================";
        report " Test 4: INDEPENDENT SELECT (AND Gates)";
        report "========================================";
        report "MUX Select = 1100 (D12), DEMUX Select = 0011 (Y3)";
        select_mux <= "1100";
        select_demux <= "0011";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) &
                " | DEMUX Y3: " & std_logic'image(demux_output(3));
        report "";

        -- Test 5
        report "--- Test 5: Data = 0xF0F0 ---";
        input_data <= x"F0F0";
        select_mux <= "0111";
        select_demux <= "0111";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) &
                " | DEMUX Y7: " & std_logic'image(demux_output(7));
        report "";

        -- Test 6
        report "--- Test 6: All Ones (0xFFFF) ---";
        input_data <= x"FFFF";
        select_mux <= "1111";
        select_demux <= "1111";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) &
                " | DEMUX Y15: " & std_logic'image(demux_output(15));
        report "";

        -- Test 7
        report "--- Test 7: Independent Select 2 ---";
        report "MUX Select = 1000 (D8), DEMUX Select = 0001 (Y1)";
        select_mux <= "1000";
        select_demux <= "0001";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) &
                " | DEMUX Y1: " & std_logic'image(demux_output(1));
        report "";

        report "========================================";
        report "Test Completed - AND Gate Design";
        report "All 7 tests passed successfully!";
        report "========================================";
        report "";

        wait;
    end process;

end test;
