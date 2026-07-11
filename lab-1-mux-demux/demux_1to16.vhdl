library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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
        -- Initialize all outputs to 0
        Y <= (others => '0');

        -- Route input to selected output
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
