-- ------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\combinedTxRx_StandardIQ\CombinedT_ip_src_FIR_Interpolation
-- Created: 2018-02-01 11:49:48
-- Generated by MATLAB 9.3 and HDL Coder 3.11
-- 
-- ------------------------------------------------------------
-- 
-- 
-- ------------------------------------------------------------
-- 
-- Module: CombinedT_ip_src_FIR_Interpolation
-- Source Path: /CombinedT_ip_src_FIR_Interpolation
-- 
-- ------------------------------------------------------------
-- 
-- HDL Implementation    : Fully parallel
-- Folding Factor        : 1
-- Multipliers           : 18


LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

ENTITY CombinedT_ip_src_FIR_Interpolation IS
   PORT( clk                             :   IN    std_logic; 
         enb_1_1_1                       :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         CombinedT_ip_src_FIR_Interpolation_in_re:   IN    std_logic_vector(15 DOWNTO 0); -- sfix16_En15
         CombinedT_ip_src_FIR_Interpolation_in_im:   IN    std_logic_vector(15 DOWNTO 0); -- sfix16_En15
         CombinedT_ip_src_FIR_Interpolation_out_re:   OUT   std_logic_vector(15 DOWNTO 0); -- sfix16_En14
         CombinedT_ip_src_FIR_Interpolation_out_im:   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
         );

END CombinedT_ip_src_FIR_Interpolation;


----------------------------------------------------------------
--Module Architecture: CombinedT_ip_src_FIR_Interpolation
----------------------------------------------------------------
ARCHITECTURE rtl OF CombinedT_ip_src_FIR_Interpolation IS
  -- Local Functions
  -- Type Definitions
  TYPE delay_pipeline_type IS ARRAY (NATURAL range <>) OF signed(15 DOWNTO 0); -- sfix16_En15
  -- Constants
  CONSTANT coeffphase1_1                  : signed(15 DOWNTO 0) := to_signed(-166, 16); -- sfix16_En15
  CONSTANT coeffphase1_2                  : signed(15 DOWNTO 0) := to_signed(50, 16); -- sfix16_En15
  CONSTANT coeffphase1_3                  : signed(15 DOWNTO 0) := to_signed(695, 16); -- sfix16_En15
  CONSTANT coeffphase1_4                  : signed(15 DOWNTO 0) := to_signed(-1738, 16); -- sfix16_En15
  CONSTANT coeffphase1_5                  : signed(15 DOWNTO 0) := to_signed(18623, 16); -- sfix16_En15
  CONSTANT coeffphase1_6                  : signed(15 DOWNTO 0) := to_signed(-1738, 16); -- sfix16_En15
  CONSTANT coeffphase1_7                  : signed(15 DOWNTO 0) := to_signed(695, 16); -- sfix16_En15
  CONSTANT coeffphase1_8                  : signed(15 DOWNTO 0) := to_signed(50, 16); -- sfix16_En15
  CONSTANT coeffphase1_9                  : signed(15 DOWNTO 0) := to_signed(-166, 16); -- sfix16_En15
  CONSTANT coeffphase2_1                  : signed(15 DOWNTO 0) := to_signed(-63, 16); -- sfix16_En15
  CONSTANT coeffphase2_2                  : signed(15 DOWNTO 0) := to_signed(-270, 16); -- sfix16_En15
  CONSTANT coeffphase2_3                  : signed(15 DOWNTO 0) := to_signed(253, 16); -- sfix16_En15
  CONSTANT coeffphase2_4                  : signed(15 DOWNTO 0) := to_signed(2570, 16); -- sfix16_En15
  CONSTANT coeffphase2_5                  : signed(15 DOWNTO 0) := to_signed(15967, 16); -- sfix16_En15
  CONSTANT coeffphase2_6                  : signed(15 DOWNTO 0) := to_signed(-2570, 16); -- sfix16_En15
  CONSTANT coeffphase2_7                  : signed(15 DOWNTO 0) := to_signed(253, 16); -- sfix16_En15
  CONSTANT coeffphase2_8                  : signed(15 DOWNTO 0) := to_signed(270, 16); -- sfix16_En15
  CONSTANT coeffphase2_9                  : signed(15 DOWNTO 0) := to_signed(0, 16); -- sfix16_En15
  CONSTANT coeffphase3_1                  : signed(15 DOWNTO 0) := to_signed(176, 16); -- sfix16_En15
  CONSTANT coeffphase3_2                  : signed(15 DOWNTO 0) := to_signed(-246, 16); -- sfix16_En15
  CONSTANT coeffphase3_3                  : signed(15 DOWNTO 0) := to_signed(-1229, 16); -- sfix16_En15
  CONSTANT coeffphase3_4                  : signed(15 DOWNTO 0) := to_signed(9481, 16); -- sfix16_En15
  CONSTANT coeffphase3_5                  : signed(15 DOWNTO 0) := to_signed(9481, 16); -- sfix16_En15
  CONSTANT coeffphase3_6                  : signed(15 DOWNTO 0) := to_signed(-1229, 16); -- sfix16_En15
  CONSTANT coeffphase3_7                  : signed(15 DOWNTO 0) := to_signed(-246, 16); -- sfix16_En15
  CONSTANT coeffphase3_8                  : signed(15 DOWNTO 0) := to_signed(176, 16); -- sfix16_En15
  CONSTANT coeffphase3_9                  : signed(15 DOWNTO 0) := to_signed(0, 16); -- sfix16_En15
  CONSTANT coeffphase4_1                  : signed(15 DOWNTO 0) := to_signed(270, 16); -- sfix16_En15
  CONSTANT coeffphase4_2                  : signed(15 DOWNTO 0) := to_signed(253, 16); -- sfix16_En15
  CONSTANT coeffphase4_3                  : signed(15 DOWNTO 0) := to_signed(-2570, 16); -- sfix16_En15
  CONSTANT coeffphase4_4                  : signed(15 DOWNTO 0) := to_signed(15967, 16); -- sfix16_En15
  CONSTANT coeffphase4_5                  : signed(15 DOWNTO 0) := to_signed(2570, 16); -- sfix16_En15
  CONSTANT coeffphase4_6                  : signed(15 DOWNTO 0) := to_signed(253, 16); -- sfix16_En15
  CONSTANT coeffphase4_7                  : signed(15 DOWNTO 0) := to_signed(-270, 16); -- sfix16_En15
  CONSTANT coeffphase4_8                  : signed(15 DOWNTO 0) := to_signed(-63, 16); -- sfix16_En15
  CONSTANT coeffphase4_9                  : signed(15 DOWNTO 0) := to_signed(0, 16); -- sfix16_En15

  -- Signals
  SIGNAL cur_count                        : unsigned(1 DOWNTO 0); -- ufix2
  SIGNAL phase_3                          : std_logic; -- boolean
  SIGNAL delay_pipeline_re                : delay_pipeline_type(0 TO 7); -- sfix16_En15
  SIGNAL delay_pipeline_im                : delay_pipeline_type(0 TO 7); -- sfix16_En15
  SIGNAL CombinedT_ip_src_FIR_Interpolation_in_regtype_re : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL CombinedT_ip_src_FIR_Interpolation_in_regtype_im : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL product_re                       : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_im                       : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_mux                      : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL product_1_re                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_1_im                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_mux_1                    : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL product_2_re                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_2_im                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_mux_2                    : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL product_3_re                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_3_im                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_mux_3                    : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL product_4_re                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_4_im                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_mux_4                    : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL product_5_re                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_5_im                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_mux_5                    : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL product_6_re                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_6_im                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_mux_6                    : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL product_7_re                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_7_im                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_mux_7                    : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL product_8_re                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_8_im                     : signed(31 DOWNTO 0); -- sfix32_En30
  SIGNAL product_mux_8                    : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL sum1_re                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL sum1_im                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast                         : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_1                       : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp                         : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL add_cast_2                       : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_3                       : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_1                       : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL sum2_re                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL sum2_im                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_4                       : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_5                       : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_2                       : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL add_cast_6                       : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_7                       : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_3                       : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL sum3_re                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL sum3_im                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_8                       : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_9                       : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_4                       : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL add_cast_10                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_11                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_5                       : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL sum4_re                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL sum4_im                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_12                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_13                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_6                       : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL add_cast_14                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_15                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_7                       : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL sum5_re                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL sum5_im                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_16                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_17                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_8                       : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL add_cast_18                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_19                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_9                       : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL sum6_re                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL sum6_im                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_20                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_21                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_10                      : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL add_cast_22                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_23                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_11                      : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL sum7_re                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL sum7_im                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_24                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_25                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_12                      : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL add_cast_26                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_27                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_13                      : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL sum8_re                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL sum8_im                          : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_28                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_29                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_14                      : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL add_cast_30                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_cast_31                      : signed(35 DOWNTO 0); -- sfix36_En30
  SIGNAL add_temp_15                      : signed(36 DOWNTO 0); -- sfix37_En30
  SIGNAL output_typeconvert_re            : signed(15 DOWNTO 0); -- sfix16_En14
  SIGNAL output_typeconvert_im            : signed(15 DOWNTO 0); -- sfix16_En14
  SIGNAL regout_re                        : signed(15 DOWNTO 0); -- sfix16_En14
  SIGNAL regout_im                        : signed(15 DOWNTO 0); -- sfix16_En14
  SIGNAL muxout_re                        : signed(15 DOWNTO 0); -- sfix16_En14
  SIGNAL muxout_im                        : signed(15 DOWNTO 0); -- sfix16_En14


BEGIN

  -- Block Statements
  ce_output : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      cur_count <= to_unsigned(0, 2);
    ELSIF clk'event AND clk = '1' THEN
      IF enb_1_1_1 = '1' THEN
        IF cur_count >= to_unsigned(3, 2) THEN
          cur_count <= to_unsigned(0, 2);
        ELSE
          cur_count <= cur_count + to_unsigned(1, 2);
        END IF;
      END IF;
    END IF; 
  END PROCESS ce_output;

  phase_3 <= '1' WHEN cur_count = to_unsigned(3, 2) AND enb_1_1_1 = '1' ELSE '0';

  --   ---------------- Delay Registers ----------------

  Delay_Pipeline_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delay_pipeline_re(0 TO 7) <= (OTHERS => (OTHERS => '0'));
      delay_pipeline_im(0 TO 7) <= (OTHERS => (OTHERS => '0'));
    ELSIF clk'event AND clk = '1' THEN
      IF phase_3 = '1' THEN
        delay_pipeline_re(0) <= signed(CombinedT_ip_src_FIR_Interpolation_in_re);
        delay_pipeline_re(1 TO 7) <= delay_pipeline_re(0 TO 6);
        delay_pipeline_im(0) <= signed(CombinedT_ip_src_FIR_Interpolation_in_im);
        delay_pipeline_im(1 TO 7) <= delay_pipeline_im(0 TO 6);
      END IF;
    END IF; 
  END PROCESS Delay_Pipeline_process;

  CombinedT_ip_src_FIR_Interpolation_in_regtype_re <= signed(CombinedT_ip_src_FIR_Interpolation_in_re);
  CombinedT_ip_src_FIR_Interpolation_in_regtype_im <= signed(CombinedT_ip_src_FIR_Interpolation_in_im);

  product_mux <= coeffphase1_9 WHEN ( cur_count = to_unsigned(0, 2) ) ELSE
                      coeffphase2_9 WHEN ( cur_count = to_unsigned(1, 2) ) ELSE
                      coeffphase3_9 WHEN ( cur_count = to_unsigned(2, 2) ) ELSE
                      coeffphase4_9;
  product_re <= delay_pipeline_re(7) * product_mux;

  product_im <= delay_pipeline_im(7) * product_mux;

  product_mux_1 <= coeffphase1_8 WHEN ( cur_count = to_unsigned(0, 2) ) ELSE
                        coeffphase2_8 WHEN ( cur_count = to_unsigned(1, 2) ) ELSE
                        coeffphase3_8 WHEN ( cur_count = to_unsigned(2, 2) ) ELSE
                        coeffphase4_8;
  product_1_re <= delay_pipeline_re(6) * product_mux_1;

  product_1_im <= delay_pipeline_im(6) * product_mux_1;

  product_mux_2 <= coeffphase1_7 WHEN ( cur_count = to_unsigned(0, 2) ) ELSE
                        coeffphase2_7 WHEN ( cur_count = to_unsigned(1, 2) ) ELSE
                        coeffphase3_7 WHEN ( cur_count = to_unsigned(2, 2) ) ELSE
                        coeffphase4_7;
  product_2_re <= delay_pipeline_re(5) * product_mux_2;

  product_2_im <= delay_pipeline_im(5) * product_mux_2;

  product_mux_3 <= coeffphase1_6 WHEN ( cur_count = to_unsigned(0, 2) ) ELSE
                        coeffphase2_6 WHEN ( cur_count = to_unsigned(1, 2) ) ELSE
                        coeffphase3_6 WHEN ( cur_count = to_unsigned(2, 2) ) ELSE
                        coeffphase4_6;
  product_3_re <= delay_pipeline_re(4) * product_mux_3;

  product_3_im <= delay_pipeline_im(4) * product_mux_3;

  product_mux_4 <= coeffphase1_5 WHEN ( cur_count = to_unsigned(0, 2) ) ELSE
                        coeffphase2_5 WHEN ( cur_count = to_unsigned(1, 2) ) ELSE
                        coeffphase3_5 WHEN ( cur_count = to_unsigned(2, 2) ) ELSE
                        coeffphase4_5;
  product_4_re <= delay_pipeline_re(3) * product_mux_4;

  product_4_im <= delay_pipeline_im(3) * product_mux_4;

  product_mux_5 <= coeffphase1_4 WHEN ( cur_count = to_unsigned(0, 2) ) ELSE
                        coeffphase2_4 WHEN ( cur_count = to_unsigned(1, 2) ) ELSE
                        coeffphase3_4 WHEN ( cur_count = to_unsigned(2, 2) ) ELSE
                        coeffphase4_4;
  product_5_re <= delay_pipeline_re(2) * product_mux_5;

  product_5_im <= delay_pipeline_im(2) * product_mux_5;

  product_mux_6 <= coeffphase1_3 WHEN ( cur_count = to_unsigned(0, 2) ) ELSE
                        coeffphase2_3 WHEN ( cur_count = to_unsigned(1, 2) ) ELSE
                        coeffphase3_3 WHEN ( cur_count = to_unsigned(2, 2) ) ELSE
                        coeffphase4_3;
  product_6_re <= delay_pipeline_re(1) * product_mux_6;

  product_6_im <= delay_pipeline_im(1) * product_mux_6;

  product_mux_7 <= coeffphase1_2 WHEN ( cur_count = to_unsigned(0, 2) ) ELSE
                        coeffphase2_2 WHEN ( cur_count = to_unsigned(1, 2) ) ELSE
                        coeffphase3_2 WHEN ( cur_count = to_unsigned(2, 2) ) ELSE
                        coeffphase4_2;
  product_7_re <= delay_pipeline_re(0) * product_mux_7;

  product_7_im <= delay_pipeline_im(0) * product_mux_7;

  product_mux_8 <= coeffphase1_1 WHEN ( cur_count = to_unsigned(0, 2) ) ELSE
                        coeffphase2_1 WHEN ( cur_count = to_unsigned(1, 2) ) ELSE
                        coeffphase3_1 WHEN ( cur_count = to_unsigned(2, 2) ) ELSE
                        coeffphase4_1;
  product_8_re <= CombinedT_ip_src_FIR_Interpolation_in_regtype_re * product_mux_8;

  product_8_im <= CombinedT_ip_src_FIR_Interpolation_in_regtype_im * product_mux_8;

  add_cast <= resize(product_8_re, 36);
  add_cast_1 <= resize(product_7_re, 36);
  add_temp <= resize(add_cast, 37) + resize(add_cast_1, 37);
  sum1_re <= add_temp(35 DOWNTO 0);

  add_cast_2 <= resize(product_8_im, 36);
  add_cast_3 <= resize(product_7_im, 36);
  add_temp_1 <= resize(add_cast_2, 37) + resize(add_cast_3, 37);
  sum1_im <= add_temp_1(35 DOWNTO 0);

  add_cast_4 <= sum1_re;
  add_cast_5 <= resize(product_6_re, 36);
  add_temp_2 <= resize(add_cast_4, 37) + resize(add_cast_5, 37);
  sum2_re <= add_temp_2(35 DOWNTO 0);

  add_cast_6 <= sum1_im;
  add_cast_7 <= resize(product_6_im, 36);
  add_temp_3 <= resize(add_cast_6, 37) + resize(add_cast_7, 37);
  sum2_im <= add_temp_3(35 DOWNTO 0);

  add_cast_8 <= sum2_re;
  add_cast_9 <= resize(product_5_re, 36);
  add_temp_4 <= resize(add_cast_8, 37) + resize(add_cast_9, 37);
  sum3_re <= add_temp_4(35 DOWNTO 0);

  add_cast_10 <= sum2_im;
  add_cast_11 <= resize(product_5_im, 36);
  add_temp_5 <= resize(add_cast_10, 37) + resize(add_cast_11, 37);
  sum3_im <= add_temp_5(35 DOWNTO 0);

  add_cast_12 <= sum3_re;
  add_cast_13 <= resize(product_4_re, 36);
  add_temp_6 <= resize(add_cast_12, 37) + resize(add_cast_13, 37);
  sum4_re <= add_temp_6(35 DOWNTO 0);

  add_cast_14 <= sum3_im;
  add_cast_15 <= resize(product_4_im, 36);
  add_temp_7 <= resize(add_cast_14, 37) + resize(add_cast_15, 37);
  sum4_im <= add_temp_7(35 DOWNTO 0);

  add_cast_16 <= sum4_re;
  add_cast_17 <= resize(product_3_re, 36);
  add_temp_8 <= resize(add_cast_16, 37) + resize(add_cast_17, 37);
  sum5_re <= add_temp_8(35 DOWNTO 0);

  add_cast_18 <= sum4_im;
  add_cast_19 <= resize(product_3_im, 36);
  add_temp_9 <= resize(add_cast_18, 37) + resize(add_cast_19, 37);
  sum5_im <= add_temp_9(35 DOWNTO 0);

  add_cast_20 <= sum5_re;
  add_cast_21 <= resize(product_2_re, 36);
  add_temp_10 <= resize(add_cast_20, 37) + resize(add_cast_21, 37);
  sum6_re <= add_temp_10(35 DOWNTO 0);

  add_cast_22 <= sum5_im;
  add_cast_23 <= resize(product_2_im, 36);
  add_temp_11 <= resize(add_cast_22, 37) + resize(add_cast_23, 37);
  sum6_im <= add_temp_11(35 DOWNTO 0);

  add_cast_24 <= sum6_re;
  add_cast_25 <= resize(product_1_re, 36);
  add_temp_12 <= resize(add_cast_24, 37) + resize(add_cast_25, 37);
  sum7_re <= add_temp_12(35 DOWNTO 0);

  add_cast_26 <= sum6_im;
  add_cast_27 <= resize(product_1_im, 36);
  add_temp_13 <= resize(add_cast_26, 37) + resize(add_cast_27, 37);
  sum7_im <= add_temp_13(35 DOWNTO 0);

  add_cast_28 <= sum7_re;
  add_cast_29 <= resize(product_re, 36);
  add_temp_14 <= resize(add_cast_28, 37) + resize(add_cast_29, 37);
  sum8_re <= add_temp_14(35 DOWNTO 0);

  add_cast_30 <= sum7_im;
  add_cast_31 <= resize(product_im, 36);
  add_temp_15 <= resize(add_cast_30, 37) + resize(add_cast_31, 37);
  sum8_im <= add_temp_15(35 DOWNTO 0);

  output_typeconvert_re <= sum8_re(31 DOWNTO 16);
  output_typeconvert_im <= sum8_im(31 DOWNTO 16);

  DataHoldRegister_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      regout_re <= (OTHERS => '0');
      regout_im <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF enb_1_1_1 = '1' THEN
        regout_re <= output_typeconvert_re;
        regout_im <= output_typeconvert_im;
      END IF;
    END IF; 
  END PROCESS DataHoldRegister_process;

  muxout_re <= output_typeconvert_re WHEN ( enb_1_1_1 = '1' ) ELSE
               regout_re;
  muxout_im <= output_typeconvert_im WHEN ( enb_1_1_1 = '1' ) ELSE
               regout_im;
  -- Assignment Statements
  CombinedT_ip_src_FIR_Interpolation_out_re <= std_logic_vector(muxout_re);
  CombinedT_ip_src_FIR_Interpolation_out_im <= std_logic_vector(muxout_im);
END rtl;