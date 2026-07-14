-- Testbench for Combined Input Selector + Output Selector
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

-- DUT component
component combined_selector is
port(
  S3_mux: in std_logic;
  S2_mux: in std_logic;
  S1_mux: in std_logic;
  S0_mux: in std_logic;

  D0_mux: in std_logic;
  D1_mux: in std_logic;
  D2_mux: in std_logic;
  D3_mux: in std_logic;
  D4_mux: in std_logic;
  D5_mux: in std_logic;
  D6_mux: in std_logic;
  D7_mux: in std_logic;
  D8_mux: in std_logic;
  D9_mux: in std_logic;
  D10_mux: in std_logic;
  D11_mux: in std_logic;
  D12_mux: in std_logic;
  D13_mux: in std_logic;
  D14_mux: in std_logic;
  D15_mux: in std_logic;

  S3_demux: in std_logic;
  S2_demux: in std_logic;
  S1_demux: in std_logic;
  S0_demux: in std_logic;

  D0_demux: out std_logic;
  D1_demux: out std_logic;
  D2_demux: out std_logic;
  D3_demux: out std_logic;
  D4_demux: out std_logic;
  D5_demux: out std_logic;
  D6_demux: out std_logic;
  D7_demux: out std_logic;
  D8_demux: out std_logic;
  D9_demux: out std_logic;
  D10_demux: out std_logic;
  D11_demux: out std_logic;
  D12_demux: out std_logic;
  D13_demux: out std_logic;
  D14_demux: out std_logic;
  D15_demux: out std_logic;

  Y: buffer std_logic);
end component;

-- Signals for MUX (Input Selector)
signal S3_mux, S2_mux, S1_mux, S0_mux: std_logic;
signal D0_mux, D1_mux, D2_mux, D3_mux, D4_mux, D5_mux, D6_mux, D7_mux: std_logic;
signal D8_mux, D9_mux, D10_mux, D11_mux, D12_mux, D13_mux, D14_mux, D15_mux: std_logic;

-- Signals for DEMUX (Output Selector)
signal S3_demux, S2_demux, S1_demux, S0_demux: std_logic;
signal D0_demux, D1_demux, D2_demux, D3_demux, D4_demux, D5_demux, D6_demux, D7_demux: std_logic;
signal D8_demux, D9_demux, D10_demux, D11_demux, D12_demux, D13_demux, D14_demux, D15_demux: std_logic;

-- Debug: MUX output
signal Y: std_logic;

begin

  -- Connect DUT
  DUT: combined_selector port map(
    -- MUX Select (Input Selector)
    S3_mux => S3_mux,
    S2_mux => S2_mux,
    S1_mux => S1_mux,
    S0_mux => S0_mux,

    -- MUX Inputs (16 data lines)
    D0_mux => D0_mux,
    D1_mux => D1_mux,
    D2_mux => D2_mux,
    D3_mux => D3_mux,
    D4_mux => D4_mux,
    D5_mux => D5_mux,
    D6_mux => D6_mux,
    D7_mux => D7_mux,
    D8_mux => D8_mux,
    D9_mux => D9_mux,
    D10_mux => D10_mux,
    D11_mux => D11_mux,
    D12_mux => D12_mux,
    D13_mux => D13_mux,
    D14_mux => D14_mux,
    D15_mux => D15_mux,

    -- DEMUX Select (Output Selector)
    S3_demux => S3_demux,
    S2_demux => S2_demux,
    S1_demux => S1_demux,
    S0_demux => S0_demux,

    -- DEMUX Outputs (16 data lines)
    D0_demux => D0_demux,
    D1_demux => D1_demux,
    D2_demux => D2_demux,
    D3_demux => D3_demux,
    D4_demux => D4_demux,
    D5_demux => D5_demux,
    D6_demux => D6_demux,
    D7_demux => D7_demux,
    D8_demux => D8_demux,
    D9_demux => D9_demux,
    D10_demux => D10_demux,
    D11_demux => D11_demux,
    D12_demux => D12_demux,
    D13_demux => D13_demux,
    D14_demux => D14_demux,
    D15_demux => D15_demux,

    Y => Y);

  process
  begin
    -- Initialize all MUX inputs to 0
    D0_mux <= '0'; D1_mux <= '0'; D2_mux <= '0'; D3_mux <= '0';
    D4_mux <= '0'; D5_mux <= '0'; D6_mux <= '0'; D7_mux <= '0';
    D8_mux <= '0'; D9_mux <= '0'; D10_mux <= '0'; D11_mux <= '0';
    D12_mux <= '0'; D13_mux <= '0'; D14_mux <= '0'; D15_mux <= '0';

    -- Test 1: MUX select D0, DEMUX select D0 -> D0_demux should be 1
    S3_mux <= '0'; S2_mux <= '0'; S1_mux <= '0'; S0_mux <= '0';
    D0_mux <= '1';
    S3_demux <= '0'; S2_demux <= '0'; S1_demux <= '0'; S0_demux <= '0';
    wait for 1 ns;
    assert(D0_demux='1') report "Fail: D0->D0 should be 1" severity error;

    -- Test 2: MUX select D0, DEMUX select D1 -> D1_demux should be 1, D0_demux should be 0
    S3_mux <= '0'; S2_mux <= '0'; S1_mux <= '0'; S0_mux <= '0';
    D0_mux <= '1';
    S3_demux <= '0'; S2_demux <= '0'; S1_demux <= '0'; S0_demux <= '1';
    wait for 1 ns;
    assert(D1_demux='1') report "Fail: D0->D1 should be 1" severity error;
    assert(D0_demux='0') report "Fail: D0_demux should be 0 in test 2" severity error;

    -- Test 3: MUX select D5, DEMUX select D5 -> D5_demux should be 1
    S3_mux <= '0'; S2_mux <= '1'; S1_mux <= '0'; S0_mux <= '1';
    D0_mux <= '0'; D5_mux <= '1';
    S3_demux <= '0'; S2_demux <= '1'; S1_demux <= '0'; S0_demux <= '1';
    wait for 1 ns;
    assert(D5_demux='1') report "Fail: D5->D5 should be 1" severity error;

    -- Test 4: MUX select D7, DEMUX select D11 -> D11_demux should be 1
    S3_mux <= '0'; S2_mux <= '1'; S1_mux <= '1'; S0_mux <= '1';
    D5_mux <= '0'; D7_mux <= '1';
    S3_demux <= '1'; S2_demux <= '0'; S1_demux <= '1'; S0_demux <= '1';
    wait for 1 ns;
    assert(D11_demux='1') report "Fail: D7->D11 should be 1" severity error;

    -- Test 5: MUX select D15, DEMUX select D7 -> D7_demux should be 1
    S3_mux <= '1'; S2_mux <= '1'; S1_mux <= '1'; S0_mux <= '1';
    D7_mux <= '0'; D15_mux <= '1';
    S3_demux <= '0'; S2_demux <= '1'; S1_demux <= '1'; S0_demux <= '1';
    wait for 1 ns;
    assert(D7_demux='1') report "Fail: D15->D7 should be 1" severity error;

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
