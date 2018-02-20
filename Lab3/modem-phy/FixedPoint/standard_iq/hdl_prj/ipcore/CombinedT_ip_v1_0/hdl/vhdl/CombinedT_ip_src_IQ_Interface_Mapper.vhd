-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\combinedTxRx_StandardIQ\CombinedT_ip_src_IQ_Interface_Mapper.vhd
-- Created: 2018-02-01 11:49:53
-- 
-- Generated by MATLAB 9.3 and HDL Coder 3.11
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: CombinedT_ip_src_IQ_Interface_Mapper
-- Source Path: combinedTxRx_StandardIQ/Combined TX and RX/IQ Interface Mapper
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY CombinedT_ip_src_IQ_Interface_Mapper IS
  PORT( byteOut                           :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix64
        validOut                          :   IN    std_logic;
        startOut                          :   IN    std_logic;
        packetLenOut                      :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        SelectorR                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En13
        SelectorI                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En13
        signal2                           :   IN    std_logic;
        err                               :   IN    std_logic;
        valid                             :   IN    std_logic;
        end_rsvd                          :   IN    std_logic;
        In11                              :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        real_rsvd                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        imag                              :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        valid_1                           :   OUT   std_logic
        );
END CombinedT_ip_src_IQ_Interface_Mapper;


ARCHITECTURE rtl OF CombinedT_ip_src_IQ_Interface_Mapper IS

  -- Signals
  SIGNAL In3                              : std_logic;
  SIGNAL In7                              : std_logic;
  SIGNAL In8                              : std_logic;
  SIGNAL In9                              : std_logic;
  SIGNAL In10                             : std_logic;
  SIGNAL Data_Type_Conversion1_out1       : signed(15 DOWNTO 0);  -- int16
  SIGNAL byteOut_unsigned                 : unsigned(63 DOWNTO 0);  -- ufix64
  SIGNAL Data_Type_Conversion_out1        : signed(15 DOWNTO 0);  -- int16

BEGIN
  In3 <= startOut;

  In7 <= signal2;

  In8 <= err;

  In9 <= valid;

  In10 <= end_rsvd;

  Data_Type_Conversion1_out1 <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & In3;

  real_rsvd <= std_logic_vector(Data_Type_Conversion1_out1);

  byteOut_unsigned <= unsigned(byteOut);

  Data_Type_Conversion_out1 <= signed(byteOut_unsigned(15 DOWNTO 0));

  imag <= std_logic_vector(Data_Type_Conversion_out1);












  valid_1 <= validOut;

END rtl;
