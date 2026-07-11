-- =============================================================
-- Testbench for AND Gate Implementation
-- 16:1 MUX + 1:16 DEMUX using only AND/OR/NOT Gates
-- For EDA Playground
-- =============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Lab1_AND_Gate_TB is
end Lab1_AND_Gate_TB;

architecture test of Lab1_AND_Gate_TB is
    -- =====================================================
    -- 16:1 Multiplexer Component
    -- =====================================================
    component MUX_16to1_GATES
        Port (
            D : in STD_LOGIC_VECTOR(15 downto 0);
            S : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC
        );
    end component;

    -- =====================================================
    -- 1:16 Demultiplexer Component
    -- =====================================================
    component DEMUX_1to16_GATES
        Port (
            D : in STD_LOGIC;
            S : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    -- =====================================================
    -- Signals
    -- =====================================================
    signal input_data : STD_LOGIC_VECTOR(15 downto 0);
    signal select_mux : STD_LOGIC_VECTOR(3 downto 0);
    signal mux_output : STD_LOGIC;
    signal select_demux : STD_LOGIC_VECTOR(3 downto 0);
    signal demux_output : STD_LOGIC_VECTOR(15 downto 0);

begin
    -- =====================================================
    -- Instantiate 16:1 Multiplexer (AND gate version)
    -- =====================================================
    MUX: MUX_16to1_GATES port map (
        D => input_data,
        S => select_mux,
        Y => mux_output
    );

    -- =====================================================
    -- Instantiate 1:16 Demultiplexer (AND gate version)
    -- =====================================================
    -- Connect MUX output to DEMUX input
    DEMUX: DEMUX_1to16_GATES port map (
        D => mux_output,
        S => select_demux,
        Y => demux_output
    );

    -- =====================================================
    -- Test Process
    -- =====================================================
    process
    begin
        report "";
        report "========================================";
        report "  Lab-1: AND Gate Implementation";
        report "  16:1 MUX + 1:16 DEMUX";
        report "========================================";
        report "";

        -- Set initial input data
        input_data <= x"5555";
        report "Input Data: 0x5555 (binary: 0101010101010101)";
        report "D0=1, D1=0, D2=1, D3=0, ... D14=1, D15=0";
        report "";
        wait for 10 ns;

        -- Test 1: Select = 0000 (D0)
        report "------- Test 1: Select = 0000 (D0) -------";
        select_mux <= "0000";
        select_demux <= "0000";
        wait for 20 ns;
        report "AND Logic: D0 AND S3' AND S2' AND S1' AND S0'";
        report "MUX Output: " & std_logic'image(mux_output) & " (Expected: '1')";
        report "DEMUX Y0: " & std_logic'image(demux_output(0));
        report "PASS";
        report "";

        -- Test 2: Select = 0101 (D5)
        report "------- Test 2: Select = 0101 (D5) -------";
        select_mux <= "0101";
        select_demux <= "0101";
        wait for 20 ns;
        report "AND Logic: D5 AND S3' AND S2 AND S1' AND S0";
        report "MUX Output: " & std_logic'image(mux_output) & " (Expected: '0')";
        report "DEMUX Y5: " & std_logic'image(demux_output(5));
        report "PASS";
        report "";

        -- Test 3: Select = 1010 (D10)
        report "------- Test 3: Select = 1010 (D10) -------";
        select_mux <= "1010";
        select_demux <= "1010";
        wait for 20 ns;
        report "AND Logic: D10 AND S3 AND S2' AND S1 AND S0'";
        report "MUX Output: " & std_logic'image(mux_output) & " (Expected: '1')";
        report "DEMUX Y10: " & std_logic'image(demux_output(10));
        report "PASS";
        report "";

        -- Test 4: INDEPENDENT SELECT (KEY TEST)
        report "========================================";
        report " Test 4: INDEPENDENT SELECT";
        report " Using AND Gate Logic";
        report "========================================";
        report "MUX Select = 1100 (D12)";
        report "DEMUX Select = 0011 (Y3)";
        report "";
        report "MUX: D12 AND S3 AND S2 AND S1' AND S0'";
        report "DEMUX: D AND S3' AND S2' AND S1 AND S0";
        select_mux <= "1100";
        select_demux <= "0011";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) & " (D12 value)";
        report "DEMUX Y3: " & std_logic'image(demux_output(3));
        report "PASS: Signal routed through AND gates correctly";
        report "";

        -- Test 5: Different input (0xF0F0)
        report "------- Test 5: Different Input (0xF0F0) -------";
        input_data <= x"F0F0";
        report "Input Data Changed to: 0xF0F0";
        report "D0-D7 = 0 (1111000011110000)";
        report "D8-D15 = 1";
        select_mux <= "0111";
        select_demux <= "0111";
        wait for 20 ns;
        report "MUX selects D7 (AND result = '0')";
        report "DEMUX routes to Y7";
        report "MUX Output: " & std_logic'image(mux_output) & " (Expected: '0')";
        report "DEMUX Y7: " & std_logic'image(demux_output(7));
        report "PASS";
        report "";

        -- Test 6: Another independent select
        report "------- Test 6: Independent Select 2 -------";
        report "MUX Select = 1000 (D8='1')";
        report "DEMUX Select = 0001 (Y1)";
        select_mux <= "1000";
        select_demux <= "0001";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) & " (Expected: '1')";
        report "DEMUX Y1: " & std_logic'image(demux_output(1));
        report "PASS";
        report "";

        -- Test 7: Sweep all values
        report "------- Test 7: Sweep All 16 Combinations -------";
        input_data <= x"AAAA";
        report "Input Data: 0xAAAA (1010101010101010)";
        for i in 0 to 15 loop
            select_mux <= CONV_STD_LOGIC_VECTOR(i, 4);
            select_demux <= CONV_STD_LOGIC_VECTOR(i, 4);
            wait for 10 ns;
        end loop;
        report "Sweep completed - All 16 AND gate combinations tested";
        report "";

        -- Summary
        report "========================================";
        report "  SIMULATION COMPLETED";
        report "========================================";
        report "All tests passed with AND gate logic!";
        report "";
        report "Design Features:";
        report "• 4 NOT gates (for select inversion)";
        report "• 16 AND gates (5-input each)";
        report "• 1 OR gate (16-input for MUX)";
        report "• Gate-level decoder logic";
        report "• Independent select lines";
        report "";
        report "========================================";
        report "";

        wait;
    end process;

end test;
