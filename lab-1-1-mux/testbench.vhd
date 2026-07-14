-- Testbench for OR gate
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component Mux16to1  is
port(
  S3: in std_logic;
  S2: in std_logic;
  S1: in std_logic;
  S0: in std_logic;

  D0: in std_logic;
  D1: in std_logic;
  D2: in std_logic;
  D3: in std_logic;
  D4: in std_logic;
  D5: in std_logic;
  D6: in std_logic;
  D7: in std_logic;
  D8: in std_logic;
  D9: in std_logic;
  D10: in std_logic;
  D11: in std_logic;
  D12: in std_logic;
  D13: in std_logic;
  D14: in std_logic;
  D15: in std_logic;
  Y: out std_logic);
end component;

signal S3, S2, S1, S0: std_logic;
signal D0, D1, D2, D3, D4, D5, D6, D7: std_logic;
signal D8, D9, D10, D11, D12, D13, D14, D15: std_logic;
signal Y: std_logic;

begin

  -- Connect DUT
  DUT: Mux16to1  port map(
    S3, S2, S1, S0,
    D0, D1, D2, D3, D4, D5, D6, D7,
    D8, D9, D10, D11, D12, D13, D14, D15,
    Y);

  process
  begin
    -- Initialize all inputs to 0
    D0 <= '0'; D1 <= '0'; D2 <= '0'; D3 <= '0';
    D4 <= '0'; D5 <= '0'; D6 <= '0'; D7 <= '0';
    D8 <= '0'; D9 <= '0'; D10 <= '0'; D11 <= '0';
    D12 <= '0'; D13 <= '0'; D14 <= '0'; D15 <= '0';

    -- Test D0 (S3=0, S2=0, S1=0, S0=0)
    S3 <= '0'; S2 <= '0'; S1 <= '0'; S0 <= '0';
    D0 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D0" severity error;
    D0 <= '0';

    -- Test D1 (S3=0, S2=0, S1=0, S0=1)
    S3 <= '0'; S2 <= '0'; S1 <= '0'; S0 <= '1';
    D1 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D1" severity error;
    D1 <= '0';

    -- Test D2 (S3=0, S2=0, S1=1, S0=0)
    S3 <= '0'; S2 <= '0'; S1 <= '1'; S0 <= '0';
    D2 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D2" severity error;
    D2 <= '0';

    -- Test D3 (S3=0, S2=0, S1=1, S0=1)
    S3 <= '0'; S2 <= '0'; S1 <= '1'; S0 <= '1';
    D3 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D3" severity error;
    D3 <= '0';

    -- Test D4 (S3=0, S2=1, S1=0, S0=0)
    S3 <= '0'; S2 <= '1'; S1 <= '0'; S0 <= '0';
    D4 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D4" severity error;
    D4 <= '0';

    -- Test D5 (S3=0, S2=1, S1=0, S0=1)
    S3 <= '0'; S2 <= '1'; S1 <= '0'; S0 <= '1';
    D5 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D5" severity error;
    D5 <= '0';

    -- Test D6 (S3=0, S2=1, S1=1, S0=0)
    S3 <= '0'; S2 <= '1'; S1 <= '1'; S0 <= '0';
    D6 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D6" severity error;
    D6 <= '0';

    -- Test D7 (S3=0, S2=1, S1=1, S0=1)
    S3 <= '0'; S2 <= '1'; S1 <= '1'; S0 <= '1';
    D7 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D7" severity error;
    D7 <= '0';

    -- Test D8 (S3=1, S2=0, S1=0, S0=0)
    S3 <= '1'; S2 <= '0'; S1 <= '0'; S0 <= '0';
    D8 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D8" severity error;
    D8 <= '0';

    -- Test D9 (S3=1, S2=0, S1=0, S0=1)
    S3 <= '1'; S2 <= '0'; S1 <= '0'; S0 <= '1';
    D9 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D9" severity error;
    D9 <= '0';

    -- Test D10 (S3=1, S2=0, S1=1, S0=0)
    S3 <= '1'; S2 <= '0'; S1 <= '1'; S0 <= '0';
    D10 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D10" severity error;
    D10 <= '0';

    -- Test D11 (S3=1, S2=0, S1=1, S0=1)
    S3 <= '1'; S2 <= '0'; S1 <= '1'; S0 <= '1';
    D11 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D11" severity error;
    D11 <= '0';

    -- Test D12 (S3=1, S2=1, S1=0, S0=0)
    S3 <= '1'; S2 <= '1'; S1 <= '0'; S0 <= '0';
    D12 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D12" severity error;
    D12 <= '0';

    -- Test D13 (S3=1, S2=1, S1=0, S0=1)
    S3 <= '1'; S2 <= '1'; S1 <= '0'; S0 <= '1';
    D13 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D13" severity error;
    D13 <= '0';

    -- Test D14 (S3=1, S2=1, S1=1, S0=0)
    S3 <= '1'; S2 <= '1'; S1 <= '1'; S0 <= '0';
    D14 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D14" severity error;
    D14 <= '0';

    -- Test D15 (S3=1, S2=1, S1=1, S0=1)
    S3 <= '1'; S2 <= '1'; S1 <= '1'; S0 <= '1';
    D15 <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D15" severity error;
    D15 <= '0';

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
