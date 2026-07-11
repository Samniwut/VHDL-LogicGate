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
  S3_input: in std_logic;
  S2_input: in std_logic;
  S1_input: in std_logic;
  S0_input: in std_logic;

  D0_in: in std_logic;
  D1_in: in std_logic;
  D2_in: in std_logic;
  D3_in: in std_logic;
  D4_in: in std_logic;
  D5_in: in std_logic;
  D6_in: in std_logic;
  D7_in: in std_logic;
  D8_in: in std_logic;
  D9_in: in std_logic;
  D10_in: in std_logic;
  D11_in: in std_logic;
  D12_in: in std_logic;
  D13_in: in std_logic;
  D14_in: in std_logic;
  D15_in: in std_logic;

  S3_output: in std_logic;
  S2_output: in std_logic;
  S1_output: in std_logic;
  S0_output: in std_logic;

  D0_out: out std_logic;
  D1_out: out std_logic;
  D2_out: out std_logic;
  D3_out: out std_logic;
  D4_out: out std_logic;
  D5_out: out std_logic;
  D6_out: out std_logic;
  D7_out: out std_logic;
  D8_out: out std_logic;
  D9_out: out std_logic;
  D10_out: out std_logic;
  D11_out: out std_logic;
  D12_out: out std_logic;
  D13_out: out std_logic;
  D14_out: out std_logic;
  D15_out: out std_logic);
end component;

-- Signals
signal S3_input_in, S2_input_in, S1_input_in, S0_input_in: std_logic;
signal D0_in_sig, D1_in_sig, D2_in_sig, D3_in_sig, D4_in_sig, D5_in_sig, D6_in_sig, D7_in_sig: std_logic;
signal D8_in_sig, D9_in_sig, D10_in_sig, D11_in_sig, D12_in_sig, D13_in_sig, D14_in_sig, D15_in_sig: std_logic;

signal S3_output_in, S2_output_in, S1_output_in, S0_output_in: std_logic;
signal D0_out_sig, D1_out_sig, D2_out_sig, D3_out_sig, D4_out_sig, D5_out_sig, D6_out_sig, D7_out_sig: std_logic;
signal D8_out_sig, D9_out_sig, D10_out_sig, D11_out_sig, D12_out_sig, D13_out_sig, D14_out_sig, D15_out_sig: std_logic;

begin

  -- Connect DUT
  DUT: combined_selector port map(
    S3_input => S3_input_in,
    S2_input => S2_input_in,
    S1_input => S1_input_in,
    S0_input => S0_input_in,

    D0_in => D0_in_sig,
    D1_in => D1_in_sig,
    D2_in => D2_in_sig,
    D3_in => D3_in_sig,
    D4_in => D4_in_sig,
    D5_in => D5_in_sig,
    D6_in => D6_in_sig,
    D7_in => D7_in_sig,
    D8_in => D8_in_sig,
    D9_in => D9_in_sig,
    D10_in => D10_in_sig,
    D11_in => D11_in_sig,
    D12_in => D12_in_sig,
    D13_in => D13_in_sig,
    D14_in => D14_in_sig,
    D15_in => D15_in_sig,

    S3_output => S3_output_in,
    S2_output => S2_output_in,
    S1_output => S1_output_in,
    S0_output => S0_output_in,

    D0_out => D0_out_sig,
    D1_out => D1_out_sig,
    D2_out => D2_out_sig,
    D3_out => D3_out_sig,
    D4_out => D4_out_sig,
    D5_out => D5_out_sig,
    D6_out => D6_out_sig,
    D7_out => D7_out_sig,
    D8_out => D8_out_sig,
    D9_out => D9_out_sig,
    D10_out => D10_out_sig,
    D11_out => D11_out_sig,
    D12_out => D12_out_sig,
    D13_out => D13_out_sig,
    D14_out => D14_out_sig,
    D15_out => D15_out_sig);

  process
  begin
    -- Initialize all inputs to 0
    D0_in_sig <= '0'; D1_in_sig <= '0'; D2_in_sig <= '0'; D3_in_sig <= '0';
    D4_in_sig <= '0'; D5_in_sig <= '0'; D6_in_sig <= '0'; D7_in_sig <= '0';
    D8_in_sig <= '0'; D9_in_sig <= '0'; D10_in_sig <= '0'; D11_in_sig <= '0';
    D12_in_sig <= '0'; D13_in_sig <= '0'; D14_in_sig <= '0'; D15_in_sig <= '0';

    -- Test 1: Select D0 as input, select D0 as output -> D0_out should be 1
    S3_input_in <= '0'; S2_input_in <= '0'; S1_input_in <= '0'; S0_input_in <= '0';
    D0_in_sig <= '1';
    S3_output_in <= '0'; S2_output_in <= '0'; S1_output_in <= '0'; S0_output_in <= '0';
    wait for 1 ns;
    assert(D0_out_sig='1') report "Fail: D0->D0 should be 1" severity error;

    -- Test 2: Select D0 as input, select D1 as output -> D1_out should be 1, D0_out should be 0
    S3_input_in <= '0'; S2_input_in <= '0'; S1_input_in <= '0'; S0_input_in <= '0';
    D0_in_sig <= '1';
    S3_output_in <= '0'; S2_output_in <= '0'; S1_output_in <= '0'; S0_output_in <= '1';
    wait for 1 ns;
    assert(D1_out_sig='1') report "Fail: D0->D1 should be 1" severity error;
    assert(D0_out_sig='0') report "Fail: D0_out should be 0 in test 2" severity error;

    -- Test 3: Select D5 as input, select D5 as output -> D5_out should be 1
    S3_input_in <= '0'; S2_input_in <= '1'; S1_input_in <= '0'; S0_input_in <= '1';
    D0_in_sig <= '0'; D5_in_sig <= '1';
    S3_output_in <= '0'; S2_output_in <= '1'; S1_output_in <= '0'; S0_output_in <= '1';
    wait for 1 ns;
    assert(D5_out_sig='1') report "Fail: D5->D5 should be 1" severity error;

    -- Test 4: Select D7 as input, select D11 as output -> D11_out should be 1
    S3_input_in <= '0'; S2_input_in <= '1'; S1_input_in <= '1'; S0_input_in <= '1';
    D5_in_sig <= '0'; D7_in_sig <= '1';
    S3_output_in <= '1'; S2_output_in <= '0'; S1_output_in <= '1'; S0_output_in <= '1';
    wait for 1 ns;
    assert(D11_out_sig='1') report "Fail: D7->D11 should be 1" severity error;

    -- Test 5: Select D15 as input, select D7 as output -> D7_out should be 1
    S3_input_in <= '1'; S2_input_in <= '1'; S1_input_in <= '1'; S0_input_in <= '1';
    D7_in_sig <= '0'; D15_in_sig <= '1';
    S3_output_in <= '0'; S2_output_in <= '1'; S1_output_in <= '1'; S0_output_in <= '1';
    wait for 1 ns;
    assert(D7_out_sig='1') report "Fail: D15->D7 should be 1" severity error;

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
