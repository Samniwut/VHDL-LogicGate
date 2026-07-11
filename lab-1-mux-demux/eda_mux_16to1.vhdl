-- =============================================================
-- 16:1 Multiplexer for EDA Playground
-- =============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_16to1 is
    Port (
        D : in STD_LOGIC_VECTOR(15 downto 0);  -- 16 input lines
        S : in STD_LOGIC_VECTOR(3 downto 0);   -- 4 select lines (S3 S2 S1 S0)
        Y : out STD_LOGIC                        -- 1 output line
    );
end MUX_16to1;

architecture Behavioral of MUX_16to1 is
begin
    -- Multiplexer logic using CASE statement
    process(D, S)
    begin
        case S is
            when "0000" => Y <= D(0);   -- Select D0
            when "0001" => Y <= D(1);   -- Select D1
            when "0010" => Y <= D(2);   -- Select D2
            when "0011" => Y <= D(3);   -- Select D3
            when "0100" => Y <= D(4);   -- Select D4
            when "0101" => Y <= D(5);   -- Select D5
            when "0110" => Y <= D(6);   -- Select D6
            when "0111" => Y <= D(7);   -- Select D7
            when "1000" => Y <= D(8);   -- Select D8
            when "1001" => Y <= D(9);   -- Select D9
            when "1010" => Y <= D(10);  -- Select D10
            when "1011" => Y <= D(11);  -- Select D11
            when "1100" => Y <= D(12);  -- Select D12
            when "1101" => Y <= D(13);  -- Select D13
            when "1110" => Y <= D(14);  -- Select D14
            when "1111" => Y <= D(15);  -- Select D15
            when others => Y <= '0';    -- Default
        end case;
    end process;

end Behavioral;
