-- VHDL Entity alien_game_lib.c5_t2_register_state.symbol
--
-- Created:
--          by - Thinkpad X1.UNKNOWN (LENOVO-PC)
--          at - 21:13:02 11/27/2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c5_t2_register_state IS
   PORT( 
      clk        : IN     std_logic;
      frame_done : IN     std_logic;
      rst_n      : IN     std_logic;
      nullify    : OUT    std_logic;
      read_en    : OUT    std_logic;
      w_rdy      : OUT    std_logic
   );

-- Declarations

END c5_t2_register_state ;

--
-- VHDL Architecture alien_game_lib.c5_t2_register_state.fsm
--
-- Created:
--          by - Thinkpad X1.UNKNOWN (LENOVO-PC)
--          at - 21:13:02 11/27/2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
 
ARCHITECTURE fsm OF c5_t2_register_state IS

   TYPE STATE_TYPE IS (
      start,
      write_mode,
      set_null,
      set_null2,
      read_mode,
      ready_write,
      write_mode1
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

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
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      current_state,
      frame_done,
      rst_n
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN start => 
            IF (rst_n = '1') THEN 
               next_state <= set_null;
            ELSE
               next_state <= start;
            END IF;
         WHEN write_mode => 
            IF (frame_done = '1') THEN 
               next_state <= read_mode;
            ELSE
               next_state <= write_mode;
            END IF;
         WHEN set_null => 
            next_state <= write_mode;
         WHEN set_null2 => 
            next_state <= ready_write;
         WHEN read_mode => 
            IF (frame_done = '0') THEN 
               next_state <= set_null2;
            ELSE
               next_state <= read_mode;
            END IF;
         WHEN ready_write => 
            next_state <= write_mode1;
         WHEN write_mode1 => 
            IF (frame_done = '1') THEN 
               next_state <= read_mode;
            ELSE
               next_state <= write_mode1;
            END IF;
         WHEN OTHERS =>
            next_state <= start;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      nullify <= '0';
      read_en <= '0';
      w_rdy <= '1';

      -- Combined Actions
      CASE current_state IS
         WHEN write_mode => 
            w_rdy <= '1';
         WHEN set_null => 
            nullify <= '1';
         WHEN set_null2 => 
            w_rdy <= '0';
             read_en <= '1';
             nullify <= '1';
         WHEN read_mode => 
            w_rdy <= '0';
         WHEN ready_write => 
            w_rdy<= '0';
             read_en <= '1';
         WHEN write_mode1 => 
            w_rdy <= '1';
             read_en <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
