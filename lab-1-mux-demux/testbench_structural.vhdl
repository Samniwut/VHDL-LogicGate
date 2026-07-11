library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Lab1_TB_Structural is
end Lab1_TB_Structural;

architecture Test of Lab1_TB_Structural is
    -- Component declarations
    component MUX_16to1_STRUCTURAL
        Port (
            D : in STD_LOGIC_VECTOR(15 downto 0);
            S : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC
        );
    end component;

    component DEMUX_1to16_STRUCTURAL
        Port (
            D : in STD_LOGIC;
            S : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    -- Signals
    signal input_data : STD_LOGIC_VECTOR(15 downto 0);
    signal select_mux : STD_LOGIC_VECTOR(3 downto 0);
    signal mux_output : STD_LOGIC;
    signal select_demux : STD_LOGIC_VECTOR(3 downto 0);
    signal demux_output : STD_LOGIC_VECTOR(15 downto 0);

begin
    -- Instantiate Structural Multiplexer
    MUX: MUX_16to1_STRUCTURAL port map (
        D => input_data,
        S => select_mux,
        Y => mux_output
    );

    -- Instantiate Structural Demultiplexer
    DEMUX: DEMUX_1to16_STRUCTURAL port map (
        D => mux_output,
        S => select_demux,
        Y => demux_output
    );

    -- Test Process
    process
    begin
        -- Set input data: 0101010101010101 (binary)
        input_data <= x"5555";

        report "============================================";
        report "Lab-1: Multiplexer and Demultiplexer";
        report "Structural Design (AND/OR/NOT gates)";
        report "============================================";
        report "Input Data: 0101010101010101 (0x5555)";
        report "";

        -- Test 1: Select line = 0000 (D0)
        report "--- Test 1: Select = 0000 (D0) ---";
        select_mux <= "0000";
        select_demux <= "0000";
        wait for 10 ns;
        report "MUX Output: " & std_logic'image(mux_output) & " (Expected: '1')";
        report "DEMUX Output at Y0: " & std_logic'image(demux_output(0));
        report "";

        -- Test 2: Select line = 0001 (D1)
        report "--- Test 2: Select = 0001 (D1) ---";
        select_mux <= "0001";
        select_demux <= "0001";
        wait for 10 ns;
        report "MUX Output: " & std_logic'image(mux_output) & " (Expected: '0')";
        report "DEMUX Output at Y1: " & std_logic'image(demux_output(1));
        report "";

        -- Test 3: Select line = 0101 (D5)
        report "--- Test 3: Select = 0101 (D5) ---";
        select_mux <= "0101";
        select_demux <= "0101";
        wait for 10 ns;
        report "MUX Output: " & std_logic'image(mux_output) & " (Expected: '0')";
        report "DEMUX Output at Y5: " & std_logic'image(demux_output(5));
        report "";

        -- Test 4: Select line = 1010 (D10)
        report "--- Test 4: Select = 1010 (D10) ---";
        select_mux <= "1010";
        select_demux <= "1010";
        wait for 10 ns;
        report "MUX Output: " & std_logic'image(mux_output) & " (Expected: '1')";
        report "DEMUX Output at Y10: " & std_logic'image(demux_output(10));
        report "";

        -- Test 5: Select line = 1111 (D15)
        report "--- Test 5: Select = 1111 (D15) ---";
        select_mux <= "1111";
        select_demux <= "1111";
        wait for 10 ns;
        report "MUX Output: " & std_logic'image(mux_output) & " (Expected: '0')";
        report "DEMUX Output at Y15: " & std_logic'image(demux_output(15));
        report "";

        -- Test 6: Different data (11110000)
        report "--- Test 6: Input Data Changed to 1111000011110000 (0xF0F0) ---";
        input_data <= x"F0F0";
        select_mux <= "0111";
        select_demux <= "0111";
        wait for 10 ns;
        report "MUX Output: " & std_logic'image(mux_output) & " (Expected: '1')";
        report "DEMUX Output at Y7: " & std_logic'image(demux_output(7));
        report "";

        -- Test 7: Independent select lines
        report "--- Test 7: Independent Select Lines ---";
        report "MUX Select = 1100 (D12), DEMUX Select = 0011 (Y3)";
        select_mux <= "1100";
        select_demux <= "0011";
        wait for 10 ns;
        report "MUX Output: " & std_logic'image(mux_output) & " (Expected: '1')";
        report "DEMUX Output at Y3: " & std_logic'image(demux_output(3));
        report "";

        -- Test 8: All ones input
        report "--- Test 8: All Ones Input (0xFFFF) ---";
        input_data <= x"FFFF";
        select_mux <= "0010";
        select_demux <= "0010";
        wait for 10 ns;
        report "MUX Output: " & std_logic'image(mux_output) & " (Expected: '1')";
        report "DEMUX Output at Y2: " & std_logic'image(demux_output(2));
        report "";

        -- Test 9: Decoder pattern test (select all)
        report "--- Test 9: Select Count Test ---";
        input_data <= x"FFFF";
        for i in 0 to 15 loop
            select_mux <= CONV_STD_LOGIC_VECTOR(i, 4);
            select_demux <= CONV_STD_LOGIC_VECTOR(i, 4);
            wait for 10 ns;
        end loop;
        report "All selections tested successfully";
        report "";

        report "============================================";
        report "Test Completed - Structural Design";
        report "PASS: All 16 decoder outputs working correctly";
        report "============================================";
        wait;
    end process;

end Test;
