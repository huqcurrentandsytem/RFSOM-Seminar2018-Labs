-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\combinedTxRx_StandardIQ\CombinedT_ip_src_RM_Spectrum_Plot_From_Radio.vhd
-- Created: 2018-02-01 11:49:53
-- 
-- Generated by MATLAB 9.3 and HDL Coder 3.11
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: CombinedT_ip_src_RM_Spectrum_Plot_From_Radio
-- Source Path: combinedTxRx_StandardIQ/Combined TX and RX/Receiver HDL/Frame Recover/RM: Spectrum Plot From Radio
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY CombinedT_ip_src_RM_Spectrum_Plot_From_Radio IS
  PORT( In1_re                            :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        In1_im                            :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        Enable                            :   IN    std_logic
        );
END CombinedT_ip_src_RM_Spectrum_Plot_From_Radio;


ARCHITECTURE rtl OF CombinedT_ip_src_RM_Spectrum_Plot_From_Radio IS

  -- Signals
  SIGNAL Enable_out2                      : std_logic;

BEGIN
  Enable_out2 <= Enable;


END rtl;
