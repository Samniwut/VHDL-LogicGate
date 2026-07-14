library IEEE;
use IEEE.std_logic_1164.all;
entity demux1to16 is
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
end demux1to16;

architecture rtl of demux1to16 is
begin
  D0 <= Y and not S3 and not S2 and not S1 and not S0;
  D1 <= Y and not S3 and not S2 and not S1 and S0;
  D2 <= Y and not S3 and not S2 and S1 and not S0;
  D3 <= Y and not S3 and not S2 and S1 and S0;
  D4 <= Y and not S3 and S2 and not S1 and not S0;
  D5 <= Y and not S3 and S2 and not S1 and S0;
  D6 <= Y and not S3 and S2 and S1 and not S0;
  D7 <= Y and not S3 and S2 and S1 and S0;
  D8 <= Y and S3 and not S2 and not S1 and not S0;
  D9 <= Y and S3 and not S2 and not S1 and S0;
  D10 <= Y and S3 and not S2 and S1 and not S0;
  D11 <= Y and S3 and not S2 and S1 and S0;
  D12 <= Y and S3 and S2 and not S1 and not S0;
  D13 <= Y and S3 and S2 and not S1 and S0;
  D14 <= Y and S3 and S2 and S1 and not S0;
  D15 <= Y and S3 and S2 and S1 and S0;
end rtl;
