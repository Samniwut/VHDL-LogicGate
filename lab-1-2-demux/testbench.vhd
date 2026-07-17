-- Testbench for Demux 1-to-16
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

-- DUT component
component demux1to16 is
port(
  S3: in std_logic;
  S2: in std_logic;
  S1: in std_logic;
  S0: in std_logic;

  Y: in std_logic;

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
signal S3, S2, S1, S0: std_logic;
signal Y: std_logic;
signal D0, D1, D2, D3, D4, D5, D6, D7: std_logic;
signal D8, D9, D10, D11, D12, D13, D14, D15: std_logic;
begin
  -- Connect DUT
  DUT: demux1to16 port map(
    S3, S2, S1, S0,
    Y,
    D0, D1, D2, D3, D4, D5, D6, D7,
    D8, D9, D10, D11, D12, D13, D14, D15);
  process
  begin
    Y <= '1';  -- Set input signal to 1
    
    -- Test D0 (S3=0, S2=0, S1=0, S0=0)
    S3 <= '0'; S2 <= '0'; S1 <= '0'; S0 <= '0';
    wait for 1 ns;
    assert(D0='1') report "Fail: D0 should be 1" severity error;
    assert(D1='0') report "Fail: D1 should be 0" severity error;

    -- Test D1 (S3=0, S2=0, S1=0, S0=1)
    S3 <= '0'; S2 <= '0'; S1 <= '0'; S0 <= '1';
    wait for 1 ns;
    assert(D1='1') report "Fail: D1 should be 1" severity error;
    assert(D0='0') report "Fail: D0 should be 0" severity error;

    -- Test D2 (S3=0, S2=0, S1=1, S0=0)
    S3 <= '0'; S2 <= '0'; S1 <= '1'; S0 <= '0';
    wait for 1 ns;
    assert(D2='1') report "Fail: D2 should be 1" severity error;

    -- Test D3 (S3=0, S2=0, S1=1, S0=1)
    S3 <= '0'; S2 <= '0'; S1 <= '1'; S0 <= '1';
    wait for 1 ns;
    assert(D3='1') report "Fail: D3 should be 1" severity error;

    -- Test D4 (S3=0, S2=1, S1=0, S0=0)
    S3 <= '0'; S2 <= '1'; S1 <= '0'; S0 <= '0';
    wait for 1 ns;
    assert(D4='1') report "Fail: D4 should be 1" severity error;

    -- Test D5 (S3=0, S2=1, S1=0, S0=1)
    S3 <= '0'; S2 <= '1'; S1 <= '0'; S0 <= '1';
    wait for 1 ns;
    assert(D5='1') report "Fail: D5 should be 1" severity error;

    -- Test D6 (S3=0, S2=1, S1=1, S0=0)
    S3 <= '0'; S2 <= '1'; S1 <= '1'; S0 <= '0';
    wait for 1 ns;
    assert(D6='1') report "Fail: D6 should be 1" severity error;

    -- Test D7 (S3=0, S2=1, S1=1, S0=1)
    S3 <= '0'; S2 <= '1'; S1 <= '1'; S0 <= '1';
    wait for 1 ns;
    assert(D7='1') report "Fail: D7 should be 1" severity error;

    -- Test D8 (S3=1, S2=0, S1=0, S0=0)
    S3 <= '1'; S2 <= '0'; S1 <= '0'; S0 <= '0';
    wait for 1 ns;
    assert(D8='1') report "Fail: D8 should be 1" severity error;

    -- Test D9 (S3=1, S2=0, S1=0, S0=1)
    S3 <= '1'; S2 <= '0'; S1 <= '0'; S0 <= '1';
    wait for 1 ns;
    assert(D9='1') report "Fail: D9 should be 1" severity error;

    -- Test D10 (S3=1, S2=0, S1=1, S0=0)
    S3 <= '1'; S2 <= '0'; S1 <= '1'; S0 <= '0';
    wait for 1 ns;
    assert(D10='1') report "Fail: D10 should be 1" severity error;

    -- Test D11 (S3=1, S2=0, S1=1, S0=1)
    S3 <= '1'; S2 <= '0'; S1 <= '1'; S0 <= '1';
    wait for 1 ns;
    assert(D11='1') report "Fail: D11 should be 1" severity error;

    -- Test D12 (S3=1, S2=1, S1=0, S0=0)
    S3 <= '1'; S2 <= '1'; S1 <= '0'; S0 <= '0';
    wait for 1 ns;
    assert(D12='1') report "Fail: D12 should be 1" severity error;

    -- Test D13 (S3=1, S2=1, S1=0, S0=1)
    S3 <= '1'; S2 <= '1'; S1 <= '0'; S0 <= '1';
    wait for 1 ns;
    assert(D13='1') report "Fail: D13 should be 1" severity error;

    -- Test D14 (S3=1, S2=1, S1=1, S0=0)
    S3 <= '1'; S2 <= '1'; S1 <= '1'; S0 <= '0';
    wait for 1 ns;
    assert(D14='1') report "Fail: D14 should be 1" severity error;

    -- Test D15 (S3=1, S2=1, S1=1, S0=1)
    S3 <= '1'; S2 <= '1'; S1 <= '1'; S0 <= '1';
    wait for 1 ns;
    assert(D15='1') report "Fail: D15 should be 1" severity error;

    S3 <= '0'; S2 <= '0'; S1 <= '0'; S0 <= '0';
    wait for 1 ns;

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
