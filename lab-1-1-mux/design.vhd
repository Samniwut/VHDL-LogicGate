library IEEE;
use IEEE.std_logic_1164.all;

entity Mux16to1 is
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
end Mux16to1 ;

architecture rtl of Mux16to1  is
begin
  Y <= (D0 and not S3 and not S2 and not S1 and not S0) or
       (D1 and not S3 and not S2 and not S1 and S0) or
       (D2 and not S3 and not S2 and S1 and not S0) or
       (D3 and not S3 and not S2 and S1 and S0) or
       (D4 and not S3 and S2 and not S1 and not S0) or
       (D5 and not S3 and S2 and not S1 and S0) or
       (D6 and not S3 and S2 and S1 and not S0) or
       (D7 and not S3 and S2 and S1 and S0) or
       (D8 and S3 and not S2 and not S1 and not S0) or
       (D9 and S3 and not S2 and not S1 and S0) or
       (D10 and S3 and not S2 and S1 and not S0) or
       (D11 and S3 and not S2 and S1 and S0) or
       (D12 and S3 and S2 and not S1 and not S0) or
       (D13 and S3 and S2 and not S1 and S0) or
       (D14 and S3 and S2 and S1 and not S0) or
       (D15 and S3 and S2 and S1 and S0);
end rtl;
