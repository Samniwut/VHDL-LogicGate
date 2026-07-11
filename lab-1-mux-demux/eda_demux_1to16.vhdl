-- =============================================================
-- 1:16 Demultiplexer for EDA Playground
-- =============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEMUX_1to16 is
    Port (
        D : in STD_LOGIC;                       -- 1 input line
        S : in STD_LOGIC_VECTOR(3 downto 0);   -- 4 select lines (S3 S2 S1 S0)
        Y : out STD_LOGIC_VECTOR(15 downto 0)  -- 16 output lines
    );
end DEMUX_1to16;

architecture Behavioral of DEMUX_1to16 is
begin
    -- Demultiplexer logic using CASE statement
    process(D, S)
    begin
        -- Initialize all outputs to 0
        Y <= (others => '0');

        -- Route input to selected output
        case S is
            when "0000" => Y(0) <= D;   -- Route to Y0
            when "0001" => Y(1) <= D;   -- Route to Y1
            when "0010" => Y(2) <= D;   -- Route to Y2
            when "0011" => Y(3) <= D;   -- Route to Y3
            when "0100" => Y(4) <= D;   -- Route to Y4
            when "0101" => Y(5) <= D;   -- Route to Y5
            when "0110" => Y(6) <= D;   -- Route to Y6
            when "0111" => Y(7) <= D;   -- Route to Y7
            when "1000" => Y(8) <= D;   -- Route to Y8
            when "1001" => Y(9) <= D;   -- Route to Y9
            when "1010" => Y(10) <= D;  -- Route to Y10
            when "1011" => Y(11) <= D;  -- Route to Y11
            when "1100" => Y(12) <= D;  -- Route to Y12
            when "1101" => Y(13) <= D;  -- Route to Y13
            when "1110" => Y(14) <= D;  -- Route to Y14
            when "1111" => Y(15) <= D;  -- Route to Y15
            when others => Y <= (others => '0');
        end case;
    end process;

end Behavioral;
