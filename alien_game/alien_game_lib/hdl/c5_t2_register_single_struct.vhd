-- VHDL Entity alien_game_lib.c5_t2_register_single.symbol
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-709-SPC)
--          at - 16:01:29 27.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c5_t2_register_single IS
   PORT( 
      clk      : IN     std_logic;
      nullify  : IN     std_logic;
      pixd_in  : IN     std_logic_vector (23 DOWNTO 0);
      read_en  : IN     std_logic;
      rst_n    : IN     std_logic;
      write    : IN     std_logic;
      pixd_out : OUT    std_logic_vector (23 DOWNTO 0)
   );

-- Declarations

END c5_t2_register_single ;

--
-- VHDL Architecture alien_game_lib.c5_t2_register_single.struct
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-709-SPC)
--          at - 16:01:28 27.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF c5_t2_register_single IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL din1      : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout      : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout1     : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout3     : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out1 : std_logic_vector(23 DOWNTO 0);

   -- Implicit buffer signal declarations
   SIGNAL pixd_out_internal : std_logic_vector (23 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_0' of 'adff'
   SIGNAL mw_U_0reg_cval : std_logic_vector(23 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_5' of 'adff'
   SIGNAL mw_U_5reg_cval : std_logic_vector(23 DOWNTO 0);


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_0' of 'adff'
   pixd_out1 <= mw_U_0reg_cval;
   u_0seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_0reg_cval <= "000000000000000000000000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_0reg_cval <= dout1;
      END IF;
   END PROCESS u_0seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_5' of 'adff'
   pixd_out_internal <= mw_U_5reg_cval;
   u_5seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_5reg_cval <= "000000000000000000000000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_5reg_cval <= dout3;
      END IF;
   END PROCESS u_5seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'constval'
   din1 <= "000000000000000000000000";

   -- ModuleWare code(v1.12) for instance 'U_1' of 'mux'
   u_1combo_proc: PROCESS(pixd_out1, pixd_in, write)
   BEGIN
      CASE write IS
      WHEN '0' => dout <= pixd_out1;
      WHEN '1' => dout <= pixd_in;
      WHEN OTHERS => dout <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_1combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_2' of 'mux'
   u_2combo_proc: PROCESS(dout, din1, nullify)
   BEGIN
      CASE nullify IS
      WHEN '0' => dout1 <= dout;
      WHEN '1' => dout1 <= din1;
      WHEN OTHERS => dout1 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_2combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_4' of 'mux'
   u_4combo_proc: PROCESS(pixd_out_internal, pixd_out1, read_en)
   BEGIN
      CASE read_en IS
      WHEN '0' => dout3 <= pixd_out_internal;
      WHEN '1' => dout3 <= pixd_out1;
      WHEN OTHERS => dout3 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_4combo_proc;

   -- Instance port mappings.

   -- Implicit buffered output assignments
   pixd_out <= pixd_out_internal;

END struct;
