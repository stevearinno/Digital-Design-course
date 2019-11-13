-- VHDL Entity alien_game_lib.c4_t2_victory_effect.symbol
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-704-SPC)
--          at - 14:15:06  5.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c4_t2_victory_effect IS
   PORT( 
      clk           : IN     std_logic;
      enable        : IN     std_logic;
      rst_n         : IN     std_logic;
      vic_px_idx    : IN     std_logic_vector (2 DOWNTO 0);
      dout9         : OUT    std_logic_vector (7 DOWNTO 0);
      victory_color : OUT    std_logic_vector (23 DOWNTO 0);
      victory_x     : OUT    std_logic_vector (7 DOWNTO 0);
      victory_y     : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c4_t2_victory_effect ;

--
-- VHDL Architecture alien_game_lib.c4_t2_victory_effect.struct
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-704-SPC)
--          at - 14:15:06  5.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c4_t2_victory_effect IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL bits_in   : std_logic_vector(7 DOWNTO 0);
   SIGNAL bits_out  : std_logic_vector(7 DOWNTO 0);
   SIGNAL bits_out1 : std_logic_vector(7 DOWNTO 0);
   SIGNAL bits_out2 : std_logic_vector(7 DOWNTO 0);
   SIGNAL bits_out3 : std_logic_vector(7 DOWNTO 0);
   SIGNAL bits_out4 : std_logic_vector(7 DOWNTO 0);
   SIGNAL bits_out5 : std_logic_vector(7 DOWNTO 0);
   SIGNAL bits_out6 : std_logic_vector(7 DOWNTO 0);
   SIGNAL d         : std_logic_vector(7 DOWNTO 0);
   SIGNAL d1        : std_logic_vector(7 DOWNTO 0);
   SIGNAL d2        : std_logic_vector(7 DOWNTO 0);
   SIGNAL d3        : std_logic_vector(7 DOWNTO 0);
   SIGNAL d4        : std_logic_vector(7 DOWNTO 0);
   SIGNAL d5        : std_logic_vector(7 DOWNTO 0);
   SIGNAL d6        : std_logic_vector(7 DOWNTO 0);
   SIGNAL d7        : std_logic_vector(7 DOWNTO 0);
   SIGNAL din1      : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout      : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout1     : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout10    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout11    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout12    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout13    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout14    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout15    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout16    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout17    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout18    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout2     : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout3     : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout4     : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout5     : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout6     : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout7     : std_logic_vector(23 DOWNTO 0);
   SIGNAL dout8     : std_logic_vector(23 DOWNTO 0);
   SIGNAL q         : std_logic_vector(7 DOWNTO 0);
   SIGNAL q1        : std_logic_vector(7 DOWNTO 0);
   SIGNAL q2        : std_logic_vector(7 DOWNTO 0);
   SIGNAL q3        : std_logic_vector(7 DOWNTO 0);
   SIGNAL q4        : std_logic_vector(7 DOWNTO 0);
   SIGNAL q5        : std_logic_vector(7 DOWNTO 0);
   SIGNAL q6        : std_logic_vector(7 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_9' of 'adff'
   SIGNAL mw_U_9reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_10' of 'adff'
   SIGNAL mw_U_10reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_11' of 'adff'
   SIGNAL mw_U_11reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_12' of 'adff'
   SIGNAL mw_U_12reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_13' of 'adff'
   SIGNAL mw_U_13reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_14' of 'adff'
   SIGNAL mw_U_14reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_15' of 'adff'
   SIGNAL mw_U_15reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_16' of 'adff'
   SIGNAL mw_U_16reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_20' of 'adff'
   SIGNAL mw_U_20reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_21' of 'adff'
   SIGNAL mw_U_21reg_cval : std_logic_vector(23 DOWNTO 0);

   -- Component Declarations
   COMPONENT c4_t2_rolling_left
   PORT (
      bits_in  : IN     std_logic_vector (7 DOWNTO 0);
      bits_out : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c4_t2_rolling_left USE ENTITY alien_game_lib.c4_t2_rolling_left;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_9' of 'adff'
   q <= mw_U_9reg_cval;
   u_9seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_9reg_cval <= "00000001";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_9reg_cval <= d;
      END IF;
   END PROCESS u_9seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_10' of 'adff'
   q1 <= mw_U_10reg_cval;
   u_10seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_10reg_cval <= "00000010";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_10reg_cval <= d1;
      END IF;
   END PROCESS u_10seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_11' of 'adff'
   q2 <= mw_U_11reg_cval;
   u_11seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_11reg_cval <= "00000100";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_11reg_cval <= d7;
      END IF;
   END PROCESS u_11seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_12' of 'adff'
   q3 <= mw_U_12reg_cval;
   u_12seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_12reg_cval <= "00001000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_12reg_cval <= d6;
      END IF;
   END PROCESS u_12seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_13' of 'adff'
   bits_in <= mw_U_13reg_cval;
   u_13seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_13reg_cval <= "00010000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_13reg_cval <= d5;
      END IF;
   END PROCESS u_13seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_14' of 'adff'
   q4 <= mw_U_14reg_cval;
   u_14seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_14reg_cval <= "00100000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_14reg_cval <= d4;
      END IF;
   END PROCESS u_14seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_15' of 'adff'
   q5 <= mw_U_15reg_cval;
   u_15seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_15reg_cval <= "01000000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_15reg_cval <= d3;
      END IF;
   END PROCESS u_15seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_16' of 'adff'
   q6 <= mw_U_16reg_cval;
   u_16seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_16reg_cval <= "10000000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_16reg_cval <= d2;
      END IF;
   END PROCESS u_16seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_20' of 'adff'
   victory_y <= mw_U_20reg_cval;
   u_20seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_20reg_cval <= "11111111";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_20reg_cval <= dout18;
      END IF;
   END PROCESS u_20seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_21' of 'adff'
   victory_color <= mw_U_21reg_cval;
   u_21seq_proc: PROCESS (clk, rst_n)
   BEGIN
      IF (rst_n = '0') THEN
         mw_U_21reg_cval <= "000000001101110001100000";
      ELSIF (clk'EVENT AND clk='1') THEN
         mw_U_21reg_cval <= dout8;
      END IF;
   END PROCESS u_21seq_proc;

   -- ModuleWare code(v1.12) for instance 'all_px' of 'constval'
   victory_x <= "11111111";

   -- ModuleWare code(v1.12) for instance 'blue' of 'constval'
   dout4 <= "111111110000000000000000";

   -- ModuleWare code(v1.12) for instance 'green' of 'constval'
   dout3 <= "000000001111111100000000";

   -- ModuleWare code(v1.12) for instance 'indigo' of 'constval'
   dout5 <= "100000100000000001001011";

   -- ModuleWare code(v1.12) for instance 'orange' of 'constval'
   dout1 <= "000000000111111111111111";

   -- ModuleWare code(v1.12) for instance 'pixel1' of 'constval'
   dout10 <= "00000001";

   -- ModuleWare code(v1.12) for instance 'pixel2' of 'constval'
   dout11 <= "00000010";

   -- ModuleWare code(v1.12) for instance 'pixel3' of 'constval'
   dout12 <= "00000100";

   -- ModuleWare code(v1.12) for instance 'pixel4' of 'constval'
   dout13 <= "00001000";

   -- ModuleWare code(v1.12) for instance 'pixel5' of 'constval'
   dout14 <= "00010000";

   -- ModuleWare code(v1.12) for instance 'pixel6' of 'constval'
   dout15 <= "00100000";

   -- ModuleWare code(v1.12) for instance 'pixel7' of 'constval'
   dout16 <= "01000000";

   -- ModuleWare code(v1.12) for instance 'pixel8' of 'constval'
   dout17 <= "10000000";

   -- ModuleWare code(v1.12) for instance 'red' of 'constval'
   dout <= "000000000000000011111111";

   -- ModuleWare code(v1.12) for instance 'violet' of 'constval'
   dout6 <= "110100110000000010010100";

   -- ModuleWare code(v1.12) for instance 'white' of 'constval'
   dout7 <= "111111111111111111111111";

   -- ModuleWare code(v1.12) for instance 'yellow' of 'constval'
   dout2 <= "000000001111111111111111";

   -- ModuleWare code(v1.12) for instance 'U_0' of 'mux'
   u_0combo_proc: PROCESS(dout7, dout, dout1, dout2, dout3, dout4, dout5, 
                          dout6, vic_px_idx)
   BEGIN
      CASE vic_px_idx IS
      WHEN "000" => dout8 <= dout7;
      WHEN "001" => dout8 <= dout;
      WHEN "010" => dout8 <= dout1;
      WHEN "011" => dout8 <= dout2;
      WHEN "100" => dout8 <= dout3;
      WHEN "101" => dout8 <= dout4;
      WHEN "110" => dout8 <= dout5;
      WHEN "111" => dout8 <= dout6;
      WHEN OTHERS => dout8 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_0combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_17' of 'mux'
   u_17combo_proc: PROCESS(q, q1, q2, q3, bits_in, q4, q5, q6, 
                           vic_px_idx)
   BEGIN
      CASE vic_px_idx IS
      WHEN "000" => dout18 <= q;
      WHEN "001" => dout18 <= q1;
      WHEN "010" => dout18 <= q2;
      WHEN "011" => dout18 <= q3;
      WHEN "100" => dout18 <= bits_in;
      WHEN "101" => dout18 <= q4;
      WHEN "110" => dout18 <= q5;
      WHEN "111" => dout18 <= q6;
      WHEN OTHERS => dout18 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_17combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_18' of 'mux'
   u_18combo_proc: PROCESS(dout10, dout11, dout12, dout13, dout14, dout15, 
                           dout16, dout17, vic_px_idx)
   BEGIN
      CASE vic_px_idx IS
      WHEN "000" => dout9 <= dout10;
      WHEN "001" => dout9 <= dout11;
      WHEN "010" => dout9 <= dout12;
      WHEN "011" => dout9 <= dout13;
      WHEN "100" => dout9 <= dout14;
      WHEN "101" => dout9 <= dout15;
      WHEN "110" => dout9 <= dout16;
      WHEN "111" => dout9 <= dout17;
      WHEN OTHERS => dout9 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_18combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_22' of 'mux'
   u_22combo_proc: PROCESS(q, bits_out, enable)
   BEGIN
      CASE enable IS
      WHEN '0' => d <= q;
      WHEN '1' => d <= bits_out;
      WHEN OTHERS => d <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_22combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_23' of 'mux'
   u_23combo_proc: PROCESS(q1, din1, enable)
   BEGIN
      CASE enable IS
      WHEN '0' => d1 <= q1;
      WHEN '1' => d1 <= din1;
      WHEN OTHERS => d1 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_23combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_24' of 'mux'
   u_24combo_proc: PROCESS(q2, bits_out1, enable)
   BEGIN
      CASE enable IS
      WHEN '0' => d7 <= q2;
      WHEN '1' => d7 <= bits_out1;
      WHEN OTHERS => d7 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_24combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_25' of 'mux'
   u_25combo_proc: PROCESS(q3, bits_out2, enable)
   BEGIN
      CASE enable IS
      WHEN '0' => d6 <= q3;
      WHEN '1' => d6 <= bits_out2;
      WHEN OTHERS => d6 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_25combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_26' of 'mux'
   u_26combo_proc: PROCESS(bits_in, bits_out3, enable)
   BEGIN
      CASE enable IS
      WHEN '0' => d5 <= bits_in;
      WHEN '1' => d5 <= bits_out3;
      WHEN OTHERS => d5 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_26combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_27' of 'mux'
   u_27combo_proc: PROCESS(q4, bits_out4, enable)
   BEGIN
      CASE enable IS
      WHEN '0' => d4 <= q4;
      WHEN '1' => d4 <= bits_out4;
      WHEN OTHERS => d4 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_27combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_28' of 'mux'
   u_28combo_proc: PROCESS(q5, bits_out5, enable)
   BEGIN
      CASE enable IS
      WHEN '0' => d3 <= q5;
      WHEN '1' => d3 <= bits_out5;
      WHEN OTHERS => d3 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_28combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_29' of 'mux'
   u_29combo_proc: PROCESS(q6, bits_out6, enable)
   BEGIN
      CASE enable IS
      WHEN '0' => d2 <= q6;
      WHEN '1' => d2 <= bits_out6;
      WHEN OTHERS => d2 <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_29combo_proc;

   -- Instance port mappings.
   U_19 : c4_t2_rolling_left
      PORT MAP (
         bits_in  => q,
         bits_out => bits_out
      );
   U_30 : c4_t2_rolling_left
      PORT MAP (
         bits_in  => q1,
         bits_out => din1
      );
   U_31 : c4_t2_rolling_left
      PORT MAP (
         bits_in  => q2,
         bits_out => bits_out1
      );
   U_32 : c4_t2_rolling_left
      PORT MAP (
         bits_in  => q3,
         bits_out => bits_out2
      );
   U_33 : c4_t2_rolling_left
      PORT MAP (
         bits_in  => bits_in,
         bits_out => bits_out3
      );
   U_34 : c4_t2_rolling_left
      PORT MAP (
         bits_in  => q4,
         bits_out => bits_out4
      );
   U_35 : c4_t2_rolling_left
      PORT MAP (
         bits_in  => q5,
         bits_out => bits_out5
      );
   U_36 : c4_t2_rolling_left
      PORT MAP (
         bits_in  => q6,
         bits_out => bits_out6
      );

END struct;
