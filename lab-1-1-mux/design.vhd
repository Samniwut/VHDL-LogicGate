-- Simple OR gate design
-- library IEEE;
-- use IEEE.std_logic_1164.all;

-- entity and_gate is
-- port(
--   a: in std_logic;
--   b: in std_logic;
--   c: in std_logic;
--   d: in std_logic;
  
--   q: out std_logic);
-- end and_gate;

-- architecture rtl of and_gate is
-- begin
--   process(a, b) is
--   begin
--     q <= a and b and c and b;
--   end process;
-- end rtl;

-- Simple OR gate design
library IEEE;
use IEEE.std_logic_1164.all;

entity and_gate is
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
end and_gate;

architecture rtl of and_gate is
begin
  process(S3, S2, S1, S0, D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15) is
  begin

if (S3='0' and S2='0' and S1='0' and S0='0') then
  Y <= D0;
elsif (S3='0' and S2='0' and S1='0' and S0='1') then
  Y <= D1;
elsif (S3='0' and S2='0' and S1='1' and S0='0') then
  Y <= D2;
elsif (S3='0' and S2='0' and S1='1' and S0='1') then
  Y <= D3;
elsif (S3='0' and S2='1' and S1='0' and S0='0') then
  Y <= D4;
elsif (S3='0' and S2='1' and S1='0' and S0='1') then
  Y <= D5;
elsif (S3='0' and S2='1' and S1='1' and S0='0') then
  Y <= D6;
elsif (S3='0' and S2='1' and S1='1' and S0='1') then
  Y <= D7;
elsif (S3='1' and S2='0' and S1='0' and S0='0') then
  Y <= D8;
elsif (S3='1' and S2='0' and S1='0' and S0='1') then
  Y <= D9;
elsif (S3='1' and S2='0' and S1='1' and S0='0') then
  Y <= D10;
elsif (S3='1' and S2='0' and S1='1' and S0='1') then
  Y <= D11;
elsif (S3='1' and S2='1' and S1='0' and S0='0') then
  Y <= D12;
elsif (S3='1' and S2='1' and S1='0' and S0='1') then
  Y <= D13;
elsif (S3='1' and S2='1' and S1='1' and S0='0') then
  Y <= D14;
elsif (S3='1' and S2='1' and S1='1' and S0='1') then
  Y <= D15;
else
  Y<= '0';
end if;
  end process;
end rtl;
