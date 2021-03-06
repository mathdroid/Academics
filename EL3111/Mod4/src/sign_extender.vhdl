-- PRAKTIKUM EL 3111 ARSITEKTUR SISTEM KOMPUTER
-- MODUL 4
-- PERCOBAAN 2
-- 17 NOV 2014
-- KELOMPOK VI
-- ROMBONGAN A
-- DAMON PRASETYO ARSO (13212001)
-- MUHAMMAD MUSTADI (13210056)
-- cla32.vhdl
-- CARRY LOOK ADDER
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.ALL;

ENTITY sign_extender IS
PORT (
  D_In :IN std_logic_vector (15 DOWNTO 0); -- Data Input 1
  D_Out :OUT std_logic_vector (31 DOWNTO 0) -- Data Input 2
);
END sign_extender;

ARCHITECTURE behavior OF sign_extender IS
BEGIN
  PROCESS (D_In)
  BEGIN
    D_Out <= std_logic_vector(resize(signed(D_In),D_Out'Length));
  END PROCESS;
END behavior;
