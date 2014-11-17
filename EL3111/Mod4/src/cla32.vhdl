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
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.ALL;

ENTITY cla_32 IS
PORT (
  OPRND_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- Operand 1
  OPRND_2 : IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Operand 2
  C_IN : IN STD_LOGIC; -- Carry In
  RESULT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0); -- Result
  C_OUT : OUT STD_LOGIC -- Overflow
);
END cla_32;

ARCHITECTURE behavior OF cla_32 IS
BEGIN
  PROCESS (OPRND_1,OPRND_2,C_IN)
  BEGIN
  C_OUT <= C_IN;
  RESULT(31 DOWNTO 0) <= OPRND_1(31 DOWNTO 0) + OPRND_2(31 DOWNTO 0);
  END PROCESS;
END behavior;
