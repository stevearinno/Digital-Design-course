-- VHDL Entity alien_game_lib.c3_t2_write_sequencer.symbol
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-704-SPC)
--          at - 17:42:57  1.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c3_t2_write_sequencer IS
   PORT( 
      alien_defeated : IN     std_logic;
      clk            : IN     std_logic;
      rst_n          : IN     std_logic;
      write_ready    : IN     std_logic;
      enable         : OUT    std_logic;
      frame_done     : OUT    std_logic;
      gun_px_idx     : OUT    std_logic_vector (2 DOWNTO 0);
      module_select  : OUT    std_logic_vector (1 DOWNTO 0);
      vic_px_idx     : OUT    std_logic_vector (2 DOWNTO 0);
      write          : OUT    std_logic
   );

-- Declarations

END c3_t2_write_sequencer ;

--
-- VHDL Architecture alien_game_lib.c3_t2_write_sequencer.fsm
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-704-SPC)
--          at - 19:16:38  1.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
 
ARCHITECTURE fsm OF c3_t2_write_sequencer IS

   TYPE STATE_TYPE IS (
      start,
      delay_1,
      alien,
      delay_2,
      gun_px_1,
      gun_px_2,
      gun_px_3,
      gun_px_4,
      gun_px_5,
      gun_px_6,
      gun_px_7,
      delay_4,
      frame_sig,
      s0,
      enable_done,
      gun_px_8,
      bullet,
      delay_3,
      delay_1b,
      victory_1,
      victory_2,
      victory_3,
      victory_4,
      victory_5,
      victory_6,
      victory_7,
      victory_8,
      delay_2b,
      frame_sig_2,
      enable_done_2,
      s1
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

   -- Declare Wait State internal signals
   SIGNAL csm_timer : std_logic_vector(24 DOWNTO 0);
   SIGNAL csm_next_timer : std_logic_vector(24 DOWNTO 0);
   SIGNAL csm_timeout : std_logic;
   SIGNAL csm_to_s0 : std_logic;
   SIGNAL csm_to_s1 : std_logic;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk,
      rst_n
   )
   -----------------------------------------------------------------
   BEGIN
      IF (rst_n = '0') THEN
         current_state <= start;
         csm_timer <= (OTHERS => '0');
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
         csm_timer <= csm_next_timer;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      alien_defeated,
      csm_timeout,
      current_state,
      write_ready
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default assignments to Wait State entry flags
      csm_to_s0 <= '0';
      csm_to_s1 <= '0';
      CASE current_state IS
         WHEN start => 
            IF (write_ready = '1' AND alien_defeated = '0') THEN 
               next_state <= delay_1;
            ELSIF (alien_defeated = '1') THEN 
               next_state <= delay_1b;
            ELSE
               next_state <= start;
            END IF;
         WHEN delay_1 => 
            IF (write_ready = '1') THEN 
               next_state <= alien;
            ELSE
               next_state <= delay_1;
            END IF;
         WHEN alien => 
            IF (write_ready = '1') THEN 
               next_state <= delay_2;
            ELSE
               next_state <= alien;
            END IF;
         WHEN delay_2 => 
            IF (write_ready = '1') THEN 
               next_state <= gun_px_1;
            ELSE
               next_state <= delay_2;
            END IF;
         WHEN gun_px_1 => 
            IF (write_ready = '1') THEN 
               next_state <= gun_px_2;
            ELSE
               next_state <= gun_px_1;
            END IF;
         WHEN gun_px_2 => 
            IF (write_ready = '1') THEN 
               next_state <= gun_px_3;
            ELSE
               next_state <= gun_px_2;
            END IF;
         WHEN gun_px_3 => 
            IF (write_ready = '1') THEN 
               next_state <= gun_px_4;
            ELSE
               next_state <= gun_px_3;
            END IF;
         WHEN gun_px_4 => 
            IF (write_ready = '1') THEN 
               next_state <= gun_px_5;
            ELSE
               next_state <= gun_px_4;
            END IF;
         WHEN gun_px_5 => 
            IF (write_ready = '1') THEN 
               next_state <= gun_px_6;
            ELSE
               next_state <= gun_px_5;
            END IF;
         WHEN gun_px_6 => 
            IF (write_ready = '1') THEN 
               next_state <= gun_px_7;
            ELSE
               next_state <= gun_px_6;
            END IF;
         WHEN gun_px_7 => 
            IF (write_ready = '1') THEN 
               next_state <= gun_px_8;
            ELSE
               next_state <= gun_px_7;
            END IF;
         WHEN delay_4 => 
            IF (write_ready = '1') THEN 
               next_state <= frame_sig;
            ELSE
               next_state <= delay_4;
            END IF;
         WHEN frame_sig => 
            next_state <= enable_done;
         WHEN s0 => 
            IF (csm_timeout = '1') THEN 
               next_state <= start;
            ELSE
               next_state <= s0;
            END IF;
         WHEN enable_done => 
            next_state <= s0;
            csm_to_s0 <= '1';
         WHEN gun_px_8 => 
            IF (write_ready = '1') THEN 
               next_state <= delay_3;
            ELSE
               next_state <= gun_px_8;
            END IF;
         WHEN bullet => 
            IF (write_ready = '1') THEN 
               next_state <= delay_4;
            ELSE
               next_state <= bullet;
            END IF;
         WHEN delay_3 => 
            IF (write_ready = '1') THEN 
               next_state <= bullet;
            ELSE
               next_state <= delay_3;
            END IF;
         WHEN delay_1b => 
            IF (alien_defeated = '1') THEN 
               next_state <= victory_1;
            ELSE
               next_state <= delay_1b;
            END IF;
         WHEN victory_1 => 
            IF (alien_defeated = '1') THEN 
               next_state <= victory_2;
            ELSE
               next_state <= victory_1;
            END IF;
         WHEN victory_2 => 
            IF (alien_defeated = '1') THEN 
               next_state <= victory_3;
            ELSE
               next_state <= victory_2;
            END IF;
         WHEN victory_3 => 
            IF (alien_defeated = '1') THEN 
               next_state <= victory_4;
            ELSE
               next_state <= victory_3;
            END IF;
         WHEN victory_4 => 
            IF (alien_defeated = '1') THEN 
               next_state <= victory_5;
            ELSE
               next_state <= victory_4;
            END IF;
         WHEN victory_5 => 
            IF (alien_defeated = '1') THEN 
               next_state <= victory_6;
            ELSE
               next_state <= victory_5;
            END IF;
         WHEN victory_6 => 
            IF (alien_defeated = '1') THEN 
               next_state <= victory_7;
            ELSE
               next_state <= victory_6;
            END IF;
         WHEN victory_7 => 
            IF (alien_defeated = '1') THEN 
               next_state <= victory_8;
            ELSE
               next_state <= victory_7;
            END IF;
         WHEN victory_8 => 
            IF (alien_defeated = '1') THEN 
               next_state <= delay_2b;
            ELSE
               next_state <= victory_8;
            END IF;
         WHEN delay_2b => 
            next_state <= frame_sig_2;
         WHEN frame_sig_2 => 
            next_state <= enable_done_2;
         WHEN enable_done_2 => 
            next_state <= s1;
            csm_to_s1 <= '1';
         WHEN s1 => 
            IF (csm_timeout = '1') THEN 
               next_state <= delay_1b;
            ELSE
               next_state <= s1;
            END IF;
         WHEN OTHERS =>
            next_state <= start;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      alien_defeated,
      csm_timeout,
      current_state,
      write_ready
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      enable <= '0';
      frame_done <= '0';
      gun_px_idx <= "000";
      module_select <= "00";
      vic_px_idx <= "000";
      write <= '0';

      -- Combined Actions
      CASE current_state IS
         WHEN start => 
            IF (write_ready = '1' AND alien_defeated = '0') THEN 
            ELSIF (alien_defeated = '1') THEN 
               module_select<="11";
            END IF;
         WHEN delay_1 => 
            IF (write_ready = '1') THEN 
               write <= '1';
            END IF;
         WHEN alien => 
            IF (write_ready = '1') THEN 
               module_select <= "01";
            END IF;
         WHEN delay_2 => 
            IF (write_ready = '1') THEN 
               module_select <= "01";
                write <= '1';
            END IF;
         WHEN gun_px_1 => 
            IF (write_ready = '1') THEN 
               gun_px_idx <= "001";
                write <= '1';
                module_select <= "01";
            END IF;
         WHEN gun_px_2 => 
            IF (write_ready = '1') THEN 
               gun_px_idx <= "010";
                write <= '1';
                module_select <= "01";
            END IF;
         WHEN gun_px_3 => 
            IF (write_ready = '1') THEN 
               gun_px_idx <= "011";
                write <= '1';
                module_select <= "01";
            END IF;
         WHEN gun_px_4 => 
            IF (write_ready = '1') THEN 
               gun_px_idx <= "100";
                write <= '1';
                module_select <= "01";
            END IF;
         WHEN gun_px_5 => 
            IF (write_ready = '1') THEN 
               gun_px_idx <= "101";
                write <= '1';
                module_select <= "01";
            END IF;
         WHEN gun_px_6 => 
            IF (write_ready = '1') THEN 
               gun_px_idx <= "110";
                write <= '1';
                module_select <= "01";
            END IF;
         WHEN gun_px_7 => 
            IF (write_ready = '1') THEN 
               gun_px_idx <= "111";
                write <= '1';
                module_select <="01";
            END IF;
         WHEN delay_4 => 
            IF (write_ready = '1') THEN 
               frame_done <= '1';
            END IF;
         WHEN frame_sig => 
            enable <= '1';
         WHEN gun_px_8 => 
            IF (write_ready = '1') THEN 
               write <= '1';
                module_select <= "10";
            END IF;
         WHEN delay_3 => 
            IF (write_ready = '1') THEN 
               write <= '1';
                module_select <= "10";
            END IF;
         WHEN delay_1b => 
            IF (alien_defeated = '1') THEN 
               write <= '1';
                module_select<="11";
            END IF;
         WHEN victory_1 => 
            IF (alien_defeated = '1') THEN 
               module_select <= "11";
                vic_px_idx <= "001";
               write <= '1';
            END IF;
         WHEN victory_2 => 
            IF (alien_defeated = '1') THEN 
               module_select <= "11";
                vic_px_idx <= "010";
               write <= '1';
            END IF;
         WHEN victory_3 => 
            IF (alien_defeated = '1') THEN 
               module_select <= "11";
                vic_px_idx <= "011";
               write <= '1';
            END IF;
         WHEN victory_4 => 
            IF (alien_defeated = '1') THEN 
               module_select <= "11";
                vic_px_idx <= "100";
               write <= '1';
            END IF;
         WHEN victory_5 => 
            IF (alien_defeated = '1') THEN 
               module_select <= "11";
                vic_px_idx <= "101";
               write <= '1';
            END IF;
         WHEN victory_6 => 
            IF (alien_defeated = '1') THEN 
               module_select <= "11";
                vic_px_idx <= "110";
               write <= '1';
            END IF;
         WHEN victory_7 => 
            IF (alien_defeated = '1') THEN 
               module_select <= "11";
                vic_px_idx <= "111";
               write <= '1';
            END IF;
         WHEN victory_8 => 
            IF (alien_defeated = '1') THEN 
               module_select <= "11";
                write<= '1';
            END IF;
         WHEN delay_2b => 
            frame_done <= '1';
             module_select<="11";
         WHEN frame_sig_2 => 
            enable <= '1';
             module_select<="11";
         WHEN s1 => 
            IF (csm_timeout = '1') THEN 
               module_select<="11";
            END IF;
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
   -----------------------------------------------------------------
   csm_wait_combo_proc: PROCESS (
      csm_timer,
      csm_to_s0,
      csm_to_s1
   )
   -----------------------------------------------------------------
   VARIABLE csm_temp_timeout : std_logic;
   BEGIN
      IF (unsigned(csm_timer) = 0) THEN
         csm_temp_timeout := '1';
      ELSE
         csm_temp_timeout := '0';
      END IF;

      IF (csm_to_s0 = '1') THEN
         csm_next_timer <= "1001100010010110011111111"; -- no cycles(20000000)-1=19999999
      ELSIF (csm_to_s1 = '1') THEN
         csm_next_timer <= "1001100010010110011111111"; -- no cycles(20000000)-1=19999999
      ELSE
         IF (csm_temp_timeout = '1') THEN
            csm_next_timer <= (OTHERS=>'0');
         ELSE
            csm_next_timer <= unsigned(csm_timer) - '1';
         END IF;
      END IF;
      csm_timeout <= csm_temp_timeout;
   END PROCESS csm_wait_combo_proc;

END fsm;
