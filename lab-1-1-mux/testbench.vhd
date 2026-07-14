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

signal S3_in, S2_in, S1_in, S0_in: std_logic;
signal D0_in, D1_in, D2_in, D3_in, D4_in, D5_in, D6_in, D7_in: std_logic;
signal D8_in, D9_in, D10_in, D11_in, D12_in, D13_in, D14_in, D15_in: std_logic;
signal Y: std_logic;

begin

  -- Connect DUT
  DUT: Mux16to1  port map(
    S3_in, S2_in, S1_in, S0_in,
    D0_in, D1_in, D2_in, D3_in, D4_in, D5_in, D6_in, D7_in,
    D8_in, D9_in, D10_in, D11_in, D12_in, D13_in, D14_in, D15_in,
    Y);

  process
  begin
    -- Initialize all inputs to 0
    D0_in <= '0'; D1_in <= '0'; D2_in <= '0'; D3_in <= '0';
    D4_in <= '0'; D5_in <= '0'; D6_in <= '0'; D7_in <= '0';
    D8_in <= '0'; D9_in <= '0'; D10_in <= '0'; D11_in <= '0';
    D12_in <= '0'; D13_in <= '0'; D14_in <= '0'; D15_in <= '0';

    -- Test D0 (S3=0, S2=0, S1=0, S0=0)
    S3_in <= '0'; S2_in <= '0'; S1_in <= '0'; S0_in <= '0';
    D0_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D0" severity error;
    D0_in <= '0';

    -- Test D1 (S3=0, S2=0, S1=0, S0=1)
    S3_in <= '0'; S2_in <= '0'; S1_in <= '0'; S0_in <= '1';
    D1_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D1" severity error;
    D1_in <= '0';

    -- Test D2 (S3=0, S2=0, S1=1, S0=0)
    S3_in <= '0'; S2_in <= '0'; S1_in <= '1'; S0_in <= '0';
    D2_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D2" severity error;
    D2_in <= '0';

    -- Test D3 (S3=0, S2=0, S1=1, S0=1)
    S3_in <= '0'; S2_in <= '0'; S1_in <= '1'; S0_in <= '1';
    D3_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D3" severity error;
    D3_in <= '0';

    -- Test D4 (S3=0, S2=1, S1=0, S0=0)
    S3_in <= '0'; S2_in <= '1'; S1_in <= '0'; S0_in <= '0';
    D4_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D4" severity error;
    D4_in <= '0';

    -- Test D5 (S3=0, S2=1, S1=0, S0=1)
    S3_in <= '0'; S2_in <= '1'; S1_in <= '0'; S0_in <= '1';
    D5_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D5" severity error;
    D5_in <= '0';

    -- Test D6 (S3=0, S2=1, S1=1, S0=0)
    S3_in <= '0'; S2_in <= '1'; S1_in <= '1'; S0_in <= '0';
    D6_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D6" severity error;
    D6_in <= '0';

    -- Test D7 (S3=0, S2=1, S1=1, S0=1)
    S3_in <= '0'; S2_in <= '1'; S1_in <= '1'; S0_in <= '1';
    D7_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D7" severity error;
    D7_in <= '0';

    -- Test D8 (S3=1, S2=0, S1=0, S0=0)
    S3_in <= '1'; S2_in <= '0'; S1_in <= '0'; S0_in <= '0';
    D8_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D8" severity error;
    D8_in <= '0';

    -- Test D9 (S3=1, S2=0, S1=0, S0=1)
    S3_in <= '1'; S2_in <= '0'; S1_in <= '0'; S0_in <= '1';
    D9_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D9" severity error;
    D9_in <= '0';

    -- Test D10 (S3=1, S2=0, S1=1, S0=0)
    S3_in <= '1'; S2_in <= '0'; S1_in <= '1'; S0_in <= '0';
    D10_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D10" severity error;
    D10_in <= '0';

    -- Test D11 (S3=1, S2=0, S1=1, S0=1)
    S3_in <= '1'; S2_in <= '0'; S1_in <= '1'; S0_in <= '1';
    D11_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D11" severity error;
    D11_in <= '0';

    -- Test D12 (S3=1, S2=1, S1=0, S0=0)
    S3_in <= '1'; S2_in <= '1'; S1_in <= '0'; S0_in <= '0';
    D12_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D12" severity error;
    D12_in <= '0';

    -- Test D13 (S3=1, S2=1, S1=0, S0=1)
    S3_in <= '1'; S2_in <= '1'; S1_in <= '0'; S0_in <= '1';
    D13_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D13" severity error;
    D13_in <= '0';

    -- Test D14 (S3=1, S2=1, S1=1, S0=0)
    S3_in <= '1'; S2_in <= '1'; S1_in <= '1'; S0_in <= '0';
    D14_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D14" severity error;
    D14_in <= '0';

    -- Test D15 (S3=1, S2=1, S1=1, S0=1)
    S3_in <= '1'; S2_in <= '1'; S1_in <= '1'; S0_in <= '1';
    D15_in <= '1';
    wait for 1 ns;
    assert(Y='1') report "Fail: Select D15" severity error;
    D15_in <= '0';

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
