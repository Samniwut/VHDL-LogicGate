library IEEE;
use IEEE.std_logic_1164.all;

-- Combined Selector (Top-level) - INLINED VERSION
entity combined_selector is
port(
  -- Input selection (select which D0-D15 input)
  S3_mux: in std_logic;
  S2_mux: in std_logic;
  S1_mux: in std_logic;
  S0_mux: in std_logic;

  -- 16 input lines
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

  -- Output selection (select which D0-D15 output)
  S3_demux: in std_logic;
  S2_demux: in std_logic;
  S1_demux: in std_logic;
  S0_demux: in std_logic;

  -- 16 output lines
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

  -- Debug: MUX output (internal signal Y)
  Y: buffer std_logic);
end combined_selector;

architecture rtl_combined of combined_selector is

begin
  -- ============================================
  -- INLINED MUX 16->1 LOGIC
  -- ============================================
  Y <= (D0_mux and not S3_mux and not S2_mux and not S1_mux and not S0_mux) or
                     (D1_mux and not S3_mux and not S2_mux and not S1_mux and S0_mux) or
                     (D2_mux and not S3_mux and not S2_mux and S1_mux and not S0_mux) or
                     (D3_mux and not S3_mux and not S2_mux and S1_mux and S0_mux) or
                     (D4_mux and not S3_mux and S2_mux and not S1_mux and not S0_mux) or
                     (D5_mux and not S3_mux and S2_mux and not S1_mux and S0_mux) or
                     (D6_mux and not S3_mux and S2_mux and S1_mux and not S0_mux) or
                     (D7_mux and not S3_mux and S2_mux and S1_mux and S0_mux) or
                     (D8_mux and S3_mux and not S2_mux and not S1_mux and not S0_mux) or
                     (D9_mux and S3_mux and not S2_mux and not S1_mux and S0_mux) or
                     (D10_mux and S3_mux and not S2_mux and S1_mux and not S0_mux) or
                     (D11_mux and S3_mux and not S2_mux and S1_mux and S0_mux) or
                     (D12_mux and S3_mux and S2_mux and not S1_mux and not S0_mux) or
                     (D13_mux and S3_mux and S2_mux and not S1_mux and S0_mux) or
                     (D14_mux and S3_mux and S2_mux and S1_mux and not S0_mux) or
                     (D15_mux and S3_mux and S2_mux and S1_mux and S0_mux);

  -- ============================================
  -- INLINED DEMUX 1->16 LOGIC
  -- ============================================
  D0_demux <= Y and not S3_demux and not S2_demux and not S1_demux and not S0_demux;
  D1_demux <= Y and not S3_demux and not S2_demux and not S1_demux and S0_demux;
  D2_demux <= Y and not S3_demux and not S2_demux and S1_demux and not S0_demux;
  D3_demux <= Y and not S3_demux and not S2_demux and S1_demux and S0_demux;
  D4_demux <= Y and not S3_demux and S2_demux and not S1_demux and not S0_demux;
  D5_demux <= Y and not S3_demux and S2_demux and not S1_demux and S0_demux;
  D6_demux <= Y and not S3_demux and S2_demux and S1_demux and not S0_demux;
  D7_demux <= Y and not S3_demux and S2_demux and S1_demux and S0_demux;
  D8_demux <= Y and S3_demux and not S2_demux and not S1_demux and not S0_demux;
  D9_demux <= Y and S3_demux and not S2_demux and not S1_demux and S0_demux;
  D10_demux <= Y and S3_demux and not S2_demux and S1_demux and not S0_demux;
  D11_demux <= Y and S3_demux and not S2_demux and S1_demux and S0_demux;
  D12_demux <= Y and S3_demux and S2_demux and not S1_demux and not S0_demux;
  D13_demux <= Y and S3_demux and S2_demux and not S1_demux and S0_demux;
  D14_demux <= Y and S3_demux and S2_demux and S1_demux and not S0_demux;
  D15_demux <= Y and S3_demux and S2_demux and S1_demux and S0_demux;

end rtl_combined;
