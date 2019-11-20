-- VHDL Entity alien_game_lib.c2_t7_coordinate.symbol
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-714-SPC)
--          at - 14:49:48 19.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c2_t7_coordinate IS
   PORT( 
      alien_defeated : IN     std_logic;
      clock          : IN     std_logic;
      en             : IN     std_logic;
      lvl3           : IN     std_logic;
      rst_n          : IN     std_logic;
      x_coord        : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord        : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c2_t7_coordinate ;

--
-- VHDL Architecture alien_game_lib.c2_t7_coordinate.struct
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-707-SPC)
--          at - 10:52:22 20.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c2_t7_coordinate IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL d               : std_logic_vector(7 DOWNTO 0);
   SIGNAL din0            : std_logic;
   SIGNAL din1            : std_logic_vector(7 DOWNTO 0);
   SIGNAL din2            : std_logic;
   SIGNAL din3            : std_logic;
   SIGNAL din4            : std_logic;
   SIGNAL din5            : std_logic;
   SIGNAL din6            : std_logic;
   SIGNAL din7            : std_logic;
   SIGNAL din8            : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout            : std_logic_vector(1 DOWNTO 0);
   SIGNAL dout1           : std_logic;
   SIGNAL dout2           : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout3           : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout4           : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout5           : std_logic;
   SIGNAL enable          : std_logic;
   SIGNAL out_left_shift  : std_logic_vector(7 DOWNTO 0);
   SIGNAL out_right_shift : std_logic_vector(7 DOWNTO 0);
   SIGNAL q               : std_logic;
   SIGNAL sel             : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL x_coord_internal : std_logic_vector (7 DOWNTO 0);
   SIGNAL y_coord_internal : std_logic_vector (7 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_4' of 'adff'
   SIGNAL mw_U_4reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_12' of 'adff'
   SIGNAL mw_U_12reg_cval : std_logic;

   -- ModuleWare signal declarations(v1.12) for instance 'U_17' of 'adff'
   SIGNAL mw_U_17reg_cval : std_logic;

   -- ModuleWare signal declarations(v1.12) for instance 'U_18' of 'adff'
   SIGNAL mw_U_18reg_cval : std_logic_vector(7 DOWNTO 0);

   -- Component Declarations
   COMPONENT c2_t3_left_shifter
   PORT (
      in_left_shift  : IN     std_logic_vector (7 DOWNTO 0);
      out_left_shift : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c2_t4_right_shifter
   PORT (
      in_right_shift  : IN     std_logic_vector (7 DOWNTO 0);
      out_right_shift : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c2_t3_left_shifter USE ENTITY alien_game_lib.c2_t3_left_shifter;
   FOR ALL : c2_t4_right_shifter USE ENTITY alien_game_lib.c2_t4_right_shifter;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_4' of 'adff'
   x_coord_internal <= mw_U_4reg_cval;
   u_4seq_proc: PROCESS (clock, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_4reg_cval <= "00100000";
      ELSIF (clock'EVENT AND clock='1') THEN
         mw_U_4reg_cval <= d;
      END IF;
   END PROCESS u_4seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_12' of 'adff'
   q <= mw_U_12reg_cval;
   u_12seq_proc: PROCESS (clock, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_12reg_cval <= '0';
      ELSIF (clock'EVENT AND clock='1') THEN
         mw_U_12reg_cval <= dout1;
      END IF;
   END PROCESS u_12seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_17' of 'adff'
   din7 <= mw_U_17reg_cval;
   u_17seq_proc: PROCESS (clock, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_17reg_cval <= '0';
      ELSIF (clock'EVENT AND clock='1') THEN
         mw_U_17reg_cval <= sel;
      END IF;
   END PROCESS u_17seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_18' of 'adff'
   y_coord_internal <= mw_U_18reg_cval;
   u_18seq_proc: PROCESS (clock, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_18reg_cval <= "00000001";
      ELSIF (clock'EVENT AND clock='1') THEN
         mw_U_18reg_cval <= dout4;
      END IF;
   END PROCESS u_18seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_6' of 'and'
   din0 <= x_coord_internal(0) AND NOT(x_coord_internal(1));

   -- ModuleWare code(v1.12) for instance 'U_7' of 'and'
   din2 <= x_coord_internal(7) AND NOT(x_coord_internal(6));

   -- ModuleWare code(v1.12) for instance 'U_10' of 'constval'
   din3 <= '0';

   -- ModuleWare code(v1.12) for instance 'U_11' of 'constval'
   din4 <= '1';

   -- ModuleWare code(v1.12) for instance 'U_14' of 'constval'
   din6 <= '0';

   -- ModuleWare code(v1.12) for instance 'U_16' of 'constval'
   din5 <= '1';

   -- ModuleWare code(v1.12) for instance 'U_8' of 'merge'
   dout <= din2 & din0;

   -- ModuleWare code(v1.12) for instance 'U_1' of 'mux'
   u_1combo_proc: PROCESS(x_coord_internal, din1, enable)
   BEGIN
      CASE enable IS
      WHEN '0' => d <= x_coord_internal;
      WHEN '1' => d <= din1;
      WHEN OTHERS => d <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_1combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_5' of 'mux'
   u_5combo_proc: PROCESS(out_left_shift, out_right_shift, q)
   BEGIN
      CASE q IS
      WHEN '0' => din1 <= out_left_shift;
      WHEN '1' => din1 <= out_right_shift;
      WHEN OTHERS => din1 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_5combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_9' of 'mux'
   u_9combo_proc: PROCESS(q, din3, din4, dout)
   BEGIN
      CASE dout IS
      WHEN "00" => dout1 <= q;
      WHEN "01" => dout1 <= din3;
      WHEN "10" => dout1 <= din4;
      WHEN "11" => dout1 <= q;
      WHEN OTHERS => dout1 <= 'X';
      END CASE;
   END PROCESS u_9combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_13' of 'mux'
   u_13combo_proc: PROCESS(en, din6, sel)
   BEGIN
      CASE sel IS
      WHEN '0' => enable <= en;
      WHEN '1' => enable <= din6;
      WHEN OTHERS => enable <= 'X';
      END CASE;
   END PROCESS u_13combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_15' of 'mux'
   u_15combo_proc: PROCESS(din7, din5, alien_defeated)
   BEGIN
      CASE alien_defeated IS
      WHEN '0' => sel <= din7;
      WHEN '1' => sel <= din5;
      WHEN OTHERS => sel <= 'X';
      END CASE;
   END PROCESS u_15combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_19' of 'mux'
   u_19combo_proc: PROCESS(y_coord_internal, dout2, lvl3)
   BEGIN
      CASE lvl3 IS
      WHEN '0' => dout3 <= y_coord_internal;
      WHEN '1' => dout3 <= dout2;
      WHEN OTHERS => dout3 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_19combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_20' of 'mux'
   u_20combo_proc: PROCESS(y_coord_internal, din8, dout5)
   BEGIN
      CASE dout5 IS
      WHEN '0' => dout2 <= y_coord_internal;
      WHEN '1' => dout2 <= din8;
      WHEN OTHERS => dout2 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_20combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_22' of 'mux'
   u_22combo_proc: PROCESS(y_coord_internal, dout3, enable)
   BEGIN
      CASE enable IS
      WHEN '0' => dout4 <= y_coord_internal;
      WHEN '1' => dout4 <= dout3;
      WHEN OTHERS => dout4 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_22combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_0' of 'or'
   dout5 <= din0 OR din2;

   -- Instance port mappings.
   U_2 : c2_t3_left_shifter
      PORT MAP (
         in_left_shift  => x_coord_internal,
         out_left_shift => out_left_shift
      );
   U_21 : c2_t3_left_shifter
      PORT MAP (
         in_left_shift  => y_coord_internal,
         out_left_shift => din8
      );
   U_3 : c2_t4_right_shifter
      PORT MAP (
         in_right_shift  => x_coord_internal,
         out_right_shift => out_right_shift
      );

   -- Implicit buffered output assignments
   x_coord <= x_coord_internal;
   y_coord <= y_coord_internal;

END struct;
