-- Testbench for Demux 1-to-16
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

-- DUT component
component and_gate is
port(
  S3: in std_logic;
  S2: in std_logic;
  S1: in std_logic;
  S0: in std_logic;

  In_signal: in std_logic;

  D0: out std_logic;
  D1: out std_logic;
  D2: out std_logic;
  D3: out std_logic;
  D4: out std_logic;
  D5: out std_logic;
  D6: out std_logic;
  D7: out std_logic;
  D8: out std_logic;
  D9: out std_logic;
  D10: out std_logic;
  D11: out std_logic;
  D12: out std_logic;
  D13: out std_logic;
  D14: out std_logic;
  D15: out std_logic);
end component;

-- Signals
signal S3_in, S2_in, S1_in, S0_in: std_logic;
signal In_signal_in: std_logic;
signal D0_out, D1_out, D2_out, D3_out, D4_out, D5_out, D6_out, D7_out: std_logic;
signal D8_out, D9_out, D10_out, D11_out, D12_out, D13_out, D14_out, D15_out: std_logic;

begin

  -- Connect DUT
  DUT: and_gate port map(
    S3_in, S2_in, S1_in, S0_in,
    In_signal_in,
    D0_out, D1_out, D2_out, D3_out, D4_out, D5_out, D6_out, D7_out,
    D8_out, D9_out, D10_out, D11_out, D12_out, D13_out, D14_out, D15_out);

  process
  begin
    In_signal_in <= '1';  -- Set input signal to 1

    -- Test D0 (S3=0, S2=0, S1=0, S0=0)
    S3_in <= '0'; S2_in <= '0'; S1_in <= '0'; S0_in <= '0';
    wait for 1 ns;
    assert(D0_out='1') report "Fail: D0 should be 1" severity error;
    assert(D1_out='0') report "Fail: D1 should be 0" severity error;

    -- Test D1 (S3=0, S2=0, S1=0, S0=1)
    S3_in <= '0'; S2_in <= '0'; S1_in <= '0'; S0_in <= '1';
    wait for 1 ns;
    assert(D1_out='1') report "Fail: D1 should be 1" severity error;
    assert(D0_out='0') report "Fail: D0 should be 0" severity error;

    -- Test D2 (S3=0, S2=0, S1=1, S0=0)
    S3_in <= '0'; S2_in <= '0'; S1_in <= '1'; S0_in <= '0';
    wait for 1 ns;
    assert(D2_out='1') report "Fail: D2 should be 1" severity error;

    -- Test D3 (S3=0, S2=0, S1=1, S0=1)
    S3_in <= '0'; S2_in <= '0'; S1_in <= '1'; S0_in <= '1';
    wait for 1 ns;
    assert(D3_out='1') report "Fail: D3 should be 1" severity error;

    -- Test D4 (S3=0, S2=1, S1=0, S0=0)
    S3_in <= '0'; S2_in <= '1'; S1_in <= '0'; S0_in <= '0';
    wait for 1 ns;
    assert(D4_out='1') report "Fail: D4 should be 1" severity error;

    -- Test D5 (S3=0, S2=1, S1=0, S0=1)
    S3_in <= '0'; S2_in <= '1'; S1_in <= '0'; S0_in <= '1';
    wait for 1 ns;
    assert(D5_out='1') report "Fail: D5 should be 1" severity error;

    -- Test D6 (S3=0, S2=1, S1=1, S0=0)
    S3_in <= '0'; S2_in <= '1'; S1_in <= '1'; S0_in <= '0';
    wait for 1 ns;
    assert(D6_out='1') report "Fail: D6 should be 1" severity error;

    -- Test D7 (S3=0, S2=1, S1=1, S0=1)
    S3_in <= '0'; S2_in <= '1'; S1_in <= '1'; S0_in <= '1';
    wait for 1 ns;
    assert(D7_out='1') report "Fail: D7 should be 1" severity error;

    -- Test D8 (S3=1, S2=0, S1=0, S0=0)
    S3_in <= '1'; S2_in <= '0'; S1_in <= '0'; S0_in <= '0';
    wait for 1 ns;
    assert(D8_out='1') report "Fail: D8 should be 1" severity error;

    -- Test D9 (S3=1, S2=0, S1=0, S0=1)
    S3_in <= '1'; S2_in <= '0'; S1_in <= '0'; S0_in <= '1';
    wait for 1 ns;
    assert(D9_out='1') report "Fail: D9 should be 1" severity error;

    -- Test D10 (S3=1, S2=0, S1=1, S0=0)
    S3_in <= '1'; S2_in <= '0'; S1_in <= '1'; S0_in <= '0';
    wait for 1 ns;
    assert(D10_out='1') report "Fail: D10 should be 1" severity error;

    -- Test D11 (S3=1, S2=0, S1=1, S0=1)
    S3_in <= '1'; S2_in <= '0'; S1_in <= '1'; S0_in <= '1';
    wait for 1 ns;
    assert(D11_out='1') report "Fail: D11 should be 1" severity error;

    -- Test D12 (S3=1, S2=1, S1=0, S0=0)
    S3_in <= '1'; S2_in <= '1'; S1_in <= '0'; S0_in <= '0';
    wait for 1 ns;
    assert(D12_out='1') report "Fail: D12 should be 1" severity error;

    -- Test D13 (S3=1, S2=1, S1=0, S0=1)
    S3_in <= '1'; S2_in <= '1'; S1_in <= '0'; S0_in <= '1';
    wait for 1 ns;
    assert(D13_out='1') report "Fail: D13 should be 1" severity error;

    -- Test D14 (S3=1, S2=1, S1=1, S0=0)
    S3_in <= '1'; S2_in <= '1'; S1_in <= '1'; S0_in <= '0';
    wait for 1 ns;
    assert(D14_out='1') report "Fail: D14 should be 1" severity error;

    -- Test D15 (S3=1, S2=1, S1=1, S0=1)
    S3_in <= '1'; S2_in <= '1'; S1_in <= '1'; S0_in <= '1';
    wait for 1 ns;
    assert(D15_out='1') report "Fail: D15 should be 1" severity error;

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
