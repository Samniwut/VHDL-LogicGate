library IEEE;
use IEEE.std_logic_1164.all;

entity and_gate is
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
end and_gate;

architecture rtl of and_gate is
begin
  process(S3, S2, S1, S0, In_signal) is
  begin
    -- Initialize all outputs to 0
    D0 <= '0'; D1 <= '0'; D2 <= '0'; D3 <= '0';
    D4 <= '0'; D5 <= '0'; D6 <= '0'; D7 <= '0';
    D8 <= '0'; D9 <= '0'; D10 <= '0'; D11 <= '0';
    D12 <= '0'; D13 <= '0'; D14 <= '0'; D15 <= '0';

    -- Route input signal to selected output
    if (S3='0' and S2='0' and S1='0' and S0='0') then
      D0 <= In_signal;
    elsif (S3='0' and S2='0' and S1='0' and S0='1') then
      D1 <= In_signal;
    elsif (S3='0' and S2='0' and S1='1' and S0='0') then
      D2 <= In_signal;
    elsif (S3='0' and S2='0' and S1='1' and S0='1') then
      D3 <= In_signal;
    elsif (S3='0' and S2='1' and S1='0' and S0='0') then
      D4 <= In_signal;
    elsif (S3='0' and S2='1' and S1='0' and S0='1') then
      D5 <= In_signal;
    elsif (S3='0' and S2='1' and S1='1' and S0='0') then
      D6 <= In_signal;
    elsif (S3='0' and S2='1' and S1='1' and S0='1') then
      D7 <= In_signal;
    elsif (S3='1' and S2='0' and S1='0' and S0='0') then
      D8 <= In_signal;
    elsif (S3='1' and S2='0' and S1='0' and S0='1') then
      D9 <= In_signal;
    elsif (S3='1' and S2='0' and S1='1' and S0='0') then
      D10 <= In_signal;
    elsif (S3='1' and S2='0' and S1='1' and S0='1') then
      D11 <= In_signal;
    elsif (S3='1' and S2='1' and S1='0' and S0='0') then
      D12 <= In_signal;
    elsif (S3='1' and S2='1' and S1='0' and S0='1') then
      D13 <= In_signal;
    elsif (S3='1' and S2='1' and S1='1' and S0='0') then
      D14 <= In_signal;
    elsif (S3='1' and S2='1' and S1='1' and S0='1') then
      D15 <= In_signal;
    end if;
  end process;
end rtl;
