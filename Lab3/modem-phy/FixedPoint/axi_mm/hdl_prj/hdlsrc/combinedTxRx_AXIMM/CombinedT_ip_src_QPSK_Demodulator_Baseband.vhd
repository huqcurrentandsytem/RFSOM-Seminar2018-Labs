-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\combinedTxRx_AXIMM\CombinedT_ip_src_QPSK_Demodulator_Baseband.vhd
-- Created: 2018-02-01 18:12:06
-- 
-- Generated by MATLAB 9.3 and HDL Coder 3.11
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: CombinedT_ip_src_QPSK_Demodulator_Baseband
-- Source Path: combinedTxRx_AXIMM/Combined TX and RX/Receiver HDL/Frame Recover/Equalization and Demodulation/QPSK 
-- Demodulator Baseban
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.CombinedT_ip_src_Combined_TX_and_RX_pkg.ALL;

ENTITY CombinedT_ip_src_QPSK_Demodulator_Baseband IS
  PORT( in0_re                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        in0_im                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        out0                              :   OUT   std_logic_vector(0 TO 1)  -- boolean [2]
        );
END CombinedT_ip_src_QPSK_Demodulator_Baseband;


ARCHITECTURE rtl OF CombinedT_ip_src_QPSK_Demodulator_Baseband IS

  -- Constants
  CONSTANT nc                             : vector_of_unsigned2(0 TO 15) := 
    (to_unsigned(16#0#, 2), to_unsigned(16#0#, 2), to_unsigned(16#3#, 2), to_unsigned(16#0#, 2),
     to_unsigned(16#1#, 2), to_unsigned(16#0#, 2), to_unsigned(16#3#, 2), to_unsigned(16#0#, 2),
     to_unsigned(16#1#, 2), to_unsigned(16#2#, 2), to_unsigned(16#2#, 2), to_unsigned(16#0#, 2),
     to_unsigned(16#0#, 2), to_unsigned(16#0#, 2), to_unsigned(16#0#, 2), to_unsigned(16#0#, 2));  -- ufix2 [16]

  -- Signals
  SIGNAL in0_re_signed                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL in0_im_signed                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL inphase_lt_zero                  : std_logic;
  SIGNAL inphase_eq_zero                  : std_logic;
  SIGNAL quadrature_lt_zero               : std_logic;
  SIGNAL quadrature_eq_zero               : std_logic;
  SIGNAL decisionLUTaddr                  : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL hardDecision                     : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL out0_part0                       : std_logic;
  SIGNAL out0_part1                       : std_logic;
  SIGNAL out0_vector                      : std_logic_vector(0 TO 1);  -- boolean [2]

BEGIN
  in0_re_signed <= signed(in0_re);

  
  inphase_lt_zero <= '1' WHEN in0_re_signed < to_signed(16#0000#, 16) ELSE
      '0';

  
  inphase_eq_zero <= '1' WHEN in0_re_signed = to_signed(16#0000#, 16) ELSE
      '0';

  in0_im_signed <= signed(in0_im);

  
  quadrature_lt_zero <= '1' WHEN in0_im_signed < to_signed(16#0000#, 16) ELSE
      '0';

  
  quadrature_eq_zero <= '1' WHEN in0_im_signed = to_signed(16#0000#, 16) ELSE
      '0';

  decisionLUTaddr <= unsigned'(inphase_lt_zero & inphase_eq_zero & quadrature_lt_zero & quadrature_eq_zero);

  hardDecision <= nc(to_integer(decisionLUTaddr));

  out0_part0 <= hardDecision(1);

  out0_part1 <= hardDecision(0);

  out0_vector(0) <= out0_part0;
  out0_vector(1) <= out0_part1;

  out0 <= out0_vector;

END rtl;
