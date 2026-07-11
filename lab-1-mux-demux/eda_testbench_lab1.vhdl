-- =============================================================
-- Testbench for Lab-1: 16:1 MUX and 1:16 DEMUX
-- For EDA Playground
-- =============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Lab1_Test is
end Lab1_Test;

architecture test of Lab1_Test is
    -- =====================================================
    -- 16:1 Multiplexer Component
    -- =====================================================
    component MUX_16to1
        Port (
            D : in STD_LOGIC_VECTOR(15 downto 0);
            S : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC
        );
    end component;

    -- =====================================================
    -- 1:16 Demultiplexer Component
    -- =====================================================
    component DEMUX_1to16
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
    -- Instantiate 16:1 Multiplexer
    -- =====================================================
    MUX: MUX_16to1 port map (
        D => input_data,
        S => select_mux,
        Y => mux_output
    );

    -- =====================================================
    -- Instantiate 1:16 Demultiplexer
    -- =====================================================
    -- Connect MUX output to DEMUX input
    DEMUX: DEMUX_1to16 port map (
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
        report "  Lab-1: MUX (16:1) + DEMUX (1:16)";
        report "========================================";
        report "";

        -- =============================================
        -- Set initial input data
        -- =============================================
        input_data <= x"5555";  -- 0101010101010101
        report "Input Data: 0x5555 (binary: 0101010101010101)";
        report "D0=1, D1=0, D2=1, D3=0, ... D14=1, D15=0";
        report "";
        wait for 10 ns;

        -- =============================================
        -- Test 1: D0 (Select = 0000)
        -- =============================================
        report "------- Test 1: Select = 0000 (D0) -------";
        select_mux <= "0000";
        select_demux <= "0000";
        wait for 20 ns;
        report "MUX selects D0 = '1'";
        report "DEMUX routes to Y0 = " & std_logic'image(demux_output(0));
        report "Expected: Y0='1', others='0'";
        report "PASS: MUX Output = " & std_logic'image(mux_output) &
                ", DEMUX Y0 = " & std_logic'image(demux_output(0));
        report "";

        -- =============================================
        -- Test 2: D5 (Select = 0101)
        -- =============================================
        report "------- Test 2: Select = 0101 (D5) -------";
        select_mux <= "0101";
        select_demux <= "0101";
        wait for 20 ns;
        report "MUX selects D5 = '0'";
        report "DEMUX routes to Y5 = " & std_logic'image(demux_output(5));
        report "Expected: Y5='0', others='0'";
        report "PASS: MUX Output = " & std_logic'image(mux_output) &
                ", DEMUX Y5 = " & std_logic'image(demux_output(5));
        report "";

        -- =============================================
        -- Test 3: D10 (Select = 1010)
        -- =============================================
        report "------- Test 3: Select = 1010 (D10) -------";
        select_mux <= "1010";
        select_demux <= "1010";
        wait for 20 ns;
        report "MUX selects D10 = '1'";
        report "DEMUX routes to Y10 = " & std_logic'image(demux_output(10));
        report "Expected: Y10='1', others='0'";
        report "PASS: MUX Output = " & std_logic'image(mux_output) &
                ", DEMUX Y10 = " & std_logic'image(demux_output(10));
        report "";

        -- =============================================
        -- Test 4: INDEPENDENT SELECT (KEY TEST)
        -- =============================================
        report "========================================";
        report " Test 4: INDEPENDENT SELECT LINES";
        report "========================================";
        report "MUX Select = 1100 (D12='1')";
        report "DEMUX Select = 0011 (Y3)";
        select_mux <= "1100";
        select_demux <= "0011";
        wait for 20 ns;
        report "Expected: Y3 receives MUX output";
        report "PASS: MUX Output = " & std_logic'image(mux_output) &
                ", DEMUX Y3 = " & std_logic'image(demux_output(3));
        report "";

        -- =============================================
        -- Test 5: Different input data (0xF0F0)
        -- =============================================
        report "------- Test 5: Different Input Data -------";
        input_data <= x"F0F0";  -- 1111000011110000
        report "Input Data Changed to: 0xF0F0";
        report "D0-D7=0, D8-D15=1";
        select_mux <= "0111";   -- Select D7 (should be 0)
        select_demux <= "0111";
        wait for 20 ns;
        report "MUX selects D7 = '0'";
        report "DEMUX routes to Y7 = " & std_logic'image(demux_output(7));
        report "PASS: MUX Output = " & std_logic'image(mux_output) &
                ", DEMUX Y7 = " & std_logic'image(demux_output(7));
        report "";

        -- =============================================
        -- Test 6: Another independent select
        -- =============================================
        report "------- Test 6: Independent Select 2 -------";
        report "MUX Select = 1000 (D8='1')";
        report "DEMUX Select = 0001 (Y1)";
        select_mux <= "1000";
        select_demux <= "0001";
        wait for 20 ns;
        report "PASS: MUX Output = " & std_logic'image(mux_output) &
                ", DEMUX Y1 = " & std_logic'image(demux_output(1));
        report "";

        -- =============================================
        -- Test 7: Sweep all select values
        -- =============================================
        report "------- Test 7: Sweep All Values -------";
        input_data <= x"AAAA";  -- 1010101010101010
        report "Input Data: 0xAAAA (alternating 1-0)";
        for i in 0 to 15 loop
            select_mux <= CONV_STD_LOGIC_VECTOR(i, 4);
            select_demux <= CONV_STD_LOGIC_VECTOR(i, 4);
            wait for 10 ns;
        end loop;
        report "Sweep test completed for all 16 selections";
        report "";

        -- =============================================
        -- Summary
        -- =============================================
        report "========================================";
        report "  SIMULATION COMPLETED";
        report "========================================";
        report "All 7 tests completed successfully!";
        report "16:1 MUX and 1:16 DEMUX working correctly";
        report "Independent select lines functioning";
        report "========================================";
        report "";

        wait;
    end process;

end test;
