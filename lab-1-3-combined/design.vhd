library IEEE;
use IEEE.std_logic_1164.all;

-- Input Selector (Mux 16->1) - Select which input D0-D15 becomes the signal
entity input_mux_16to1 is
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

  Signal_out: out std_logic);
end input_mux_16to1;

architecture rtl_input_mux of input_mux_16to1 is
begin
  Signal_out <= (D0 and not S3 and not S2 and not S1 and not S0) or
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
end rtl_input_mux;

-- Output Selector (Demux 1->16) - Select which output D0-D15 receives the signal
library IEEE;
use IEEE.std_logic_1164.all;

entity output_demux_1to16 is
port(
  S3: in std_logic;
  S2: in std_logic;
  S1: in std_logic;
  S0: in std_logic;

  Signal_in: in std_logic;

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
end output_demux_1to16;

architecture rtl_output_demux of output_demux_1to16 is
begin
  D0 <= Signal_in and not S3 and not S2 and not S1 and not S0;
  D1 <= Signal_in and not S3 and not S2 and not S1 and S0;
  D2 <= Signal_in and not S3 and not S2 and S1 and not S0;
  D3 <= Signal_in and not S3 and not S2 and S1 and S0;
  D4 <= Signal_in and not S3 and S2 and not S1 and not S0;
  D5 <= Signal_in and not S3 and S2 and not S1 and S0;
  D6 <= Signal_in and not S3 and S2 and S1 and not S0;
  D7 <= Signal_in and not S3 and S2 and S1 and S0;
  D8 <= Signal_in and S3 and not S2 and not S1 and not S0;
  D9 <= Signal_in and S3 and not S2 and not S1 and S0;
  D10 <= Signal_in and S3 and not S2 and S1 and not S0;
  D11 <= Signal_in and S3 and not S2 and S1 and S0;
  D12 <= Signal_in and S3 and S2 and not S1 and not S0;
  D13 <= Signal_in and S3 and S2 and not S1 and S0;
  D14 <= Signal_in and S3 and S2 and S1 and not S0;
  D15 <= Signal_in and S3 and S2 and S1 and S0;
end rtl_output_demux;

-- Combined Selector (Top-level)
library IEEE;
use IEEE.std_logic_1164.all;

entity combined_selector is
port(
  -- Input selection (select which D0-D15 input)
  S3_input: in std_logic;
  S2_input: in std_logic;
  S1_input: in std_logic;
  S0_input: in std_logic;

  -- 16 input lines
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

  -- Output selection (select which D0-D15 output)
  S3_output: in std_logic;
  S2_output: in std_logic;
  S1_output: in std_logic;
  S0_output: in std_logic;

  -- 16 output lines
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
end combined_selector;

architecture rtl_combined of combined_selector is
  -- Internal signal connecting input selector to output selector
  signal internal_signal: std_logic;

  -- Component declarations
  component input_mux_16to1 is
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
    Signal_out: out std_logic);
  end component;

  component output_demux_1to16 is
  port(
    S3: in std_logic;
    S2: in std_logic;
    S1: in std_logic;
    S0: in std_logic;
    
    Signal_in: in std_logic;
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

begin
  -- Instance Input Selector
  INPUT_INST: input_mux_16to1 port map(
    S3 => S3_input,
    S2 => S2_input,
    S1 => S1_input,
    S0 => S0_input,
    D0 => D0_in,
    D1 => D1_in,
    D2 => D2_in,
    D3 => D3_in,
    D4 => D4_in,
    D5 => D5_in,
    D6 => D6_in,
    D7 => D7_in,
    D8 => D8_in,
    D9 => D9_in,
    D10 => D10_in,
    D11 => D11_in,
    D12 => D12_in,
    D13 => D13_in,
    D14 => D14_in,
    D15 => D15_in,
    Signal_out => internal_signal);

  -- Instance Output Selector
  OUTPUT_INST: output_demux_1to16 port map(
    S3 => S3_output,
    S2 => S2_output,
    S1 => S1_output,
    S0 => S0_output,
    Signal_in => internal_signal,
    D0 => D0_out,
    D1 => D1_out,
    D2 => D2_out,
    D3 => D3_out,
    D4 => D4_out,
    D5 => D5_out,
    D6 => D6_out,
    D7 => D7_out,
    D8 => D8_out,
    D9 => D9_out,
    D10 => D10_out,
    D11 => D11_out,
    D12 => D12_out,
    D13 => D13_out,
    D14 => D14_out,
    D15 => D15_out);

end rtl_combined;
