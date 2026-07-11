-- =============================================================
-- Lab-1: 16:1 Multiplexer and 1:16 Demultiplexer
-- For EDA Playground - All in One File
-- =============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- =====================================================
-- 16:1 Multiplexer Entity
-- =====================================================
entity MUX_16to1 is
    Port (
        D : in STD_LOGIC_VECTOR(15 downto 0);  -- 16 input lines
        S : in STD_LOGIC_VECTOR(3 downto 0);   -- 4 select lines
        Y : out STD_LOGIC                        -- 1 output line
    );
end MUX_16to1;

architecture Behavioral of MUX_16to1 is
begin
    process(D, S)
    begin
        case S is
            when "0000" => Y <= D(0);
            when "0001" => Y <= D(1);
            when "0010" => Y <= D(2);
            when "0011" => Y <= D(3);
            when "0100" => Y <= D(4);
            when "0101" => Y <= D(5);
            when "0110" => Y <= D(6);
            when "0111" => Y <= D(7);
            when "1000" => Y <= D(8);
            when "1001" => Y <= D(9);
            when "1010" => Y <= D(10);
            when "1011" => Y <= D(11);
            when "1100" => Y <= D(12);
            when "1101" => Y <= D(13);
            when "1110" => Y <= D(14);
            when "1111" => Y <= D(15);
            when others => Y <= '0';
        end case;
    end process;
end Behavioral;

-- =====================================================
-- 1:16 Demultiplexer Entity
-- =====================================================
entity DEMUX_1to16 is
    Port (
        D : in STD_LOGIC;                       -- 1 input line
        S : in STD_LOGIC_VECTOR(3 downto 0);   -- 4 select lines
        Y : out STD_LOGIC_VECTOR(15 downto 0)  -- 16 output lines
    );
end DEMUX_1to16;

architecture Behavioral of DEMUX_1to16 is
begin
    process(D, S)
    begin
        Y <= (others => '0');  -- Initialize all outputs to 0

        case S is
            when "0000" => Y(0) <= D;
            when "0001" => Y(1) <= D;
            when "0010" => Y(2) <= D;
            when "0011" => Y(3) <= D;
            when "0100" => Y(4) <= D;
            when "0101" => Y(5) <= D;
            when "0110" => Y(6) <= D;
            when "0111" => Y(7) <= D;
            when "1000" => Y(8) <= D;
            when "1001" => Y(9) <= D;
            when "1010" => Y(10) <= D;
            when "1011" => Y(11) <= D;
            when "1100" => Y(12) <= D;
            when "1101" => Y(13) <= D;
            when "1110" => Y(14) <= D;
            when "1111" => Y(15) <= D;
            when others => Y <= (others => '0');
        end case;
    end process;
end Behavioral;

-- =====================================================
-- Testbench for Lab-1
-- =====================================================
entity Lab1_Test is
end Lab1_Test;

architecture test of Lab1_Test is
    -- Component declarations
    component MUX_16to1
        Port (
            D : in STD_LOGIC_VECTOR(15 downto 0);
            S : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC
        );
    end component;

    component DEMUX_1to16
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
    -- Instantiate 16:1 Multiplexer
    MUX: MUX_16to1 port map (
        D => input_data,
        S => select_mux,
        Y => mux_output
    );

    -- Instantiate 1:16 Demultiplexer
    -- Connect MUX output to DEMUX input
    DEMUX: DEMUX_1to16 port map (
        D => mux_output,
        S => select_demux,
        Y => demux_output
    );

    -- Test Process
    process
    begin
        report "========================================";
        report "Lab-1: MUX (16:1) and DEMUX (1:16)";
        report "EDA Playground Version";
        report "========================================";

        -- Set input data: 0x5555 = 0101010101010101
        input_data <= x"5555";
        report "Input Data: 0x5555 (binary: 0101010101010101)";
        report "";

        -- Test 1: Same select lines
        report "=== Test 1: Same Select Lines ===";
        report "Select MUX = 0000, Select DEMUX = 0000 (D0)";
        select_mux <= "0000";
        select_demux <= "0000";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) &
                " | DEMUX Y0: " & std_logic'image(demux_output(0));
        report "";

        -- Test 2
        report "=== Test 2: Same Select Lines ===";
        report "Select MUX = 0101, Select DEMUX = 0101 (D5)";
        select_mux <= "0101";
        select_demux <= "0101";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) &
                " | DEMUX Y5: " & std_logic'image(demux_output(5));
        report "";

        -- Test 3
        report "=== Test 3: Same Select Lines ===";
        report "Select MUX = 1010, Select DEMUX = 1010 (D10)";
        select_mux <= "1010";
        select_demux <= "1010";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) &
                " | DEMUX Y10: " & std_logic'image(demux_output(10));
        report "";

        -- Test 4: Independent select (main test)
        report "=== Test 4: Independent Select Lines ===";
        report "MUX Select = 1100 (D12), DEMUX Select = 0011 (Y3)";
        select_mux <= "1100";
        select_demux <= "0011";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) &
                " | DEMUX Y3: " & std_logic'image(demux_output(3)) &
                " | DEMUX Y12: " & std_logic'image(demux_output(12));
        report "";

        -- Test 5: Change input data
        report "=== Test 5: Different Input Data ===";
        input_data <= x"F0F0";
        report "Input Data Changed to: 0xF0F0 (binary: 1111000011110000)";
        select_mux <= "0111";
        select_demux <= "0111";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) &
                " | DEMUX Y7: " & std_logic'image(demux_output(7));
        report "";

        -- Test 6: All ones
        report "=== Test 6: All Ones Input ===";
        input_data <= x"FFFF";
        select_mux <= "1111";
        select_demux <= "1111";
        wait for 20 ns;
        report "MUX Output: " & std_logic'image(mux_output) &
                " | DEMUX Y15: " & std_logic'image(demux_output(15));
        report "";

        -- Test 7: Sweep all select values
        report "=== Test 7: Sweep All Select Values ===";
        input_data <= x"AAAA";
        for i in 0 to 15 loop
            select_mux <= CONV_STD_LOGIC_VECTOR(i, 4);
            select_demux <= CONV_STD_LOGIC_VECTOR(i, 4);
            wait for 10 ns;
        end loop;
        report "Sweep test completed";
        report "";

        report "========================================";
        report "All tests completed successfully!";
        report "========================================";
        wait;
    end process;

end test;
