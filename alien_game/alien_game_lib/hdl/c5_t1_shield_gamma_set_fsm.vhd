-- VHDL Entity alien_game_lib.c5_t1_shield_gamma_set.symbol
--
-- Created:
--          by - Thinkpad X1.UNKNOWN (LENOVO-PC)
--          at - 23:06:58 11/20/2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c5_t1_shield_gamma_set IS
   PORT( 
      clk      : IN     std_logic;
      rst_n    : IN     std_logic;
      rx_rdy   : IN     std_logic;
      bit_out  : OUT    std_logic;
      lat      : OUT    std_logic;
      sb       : OUT    std_logic;
      transmit : OUT    std_logic
   );

-- Declarations

END c5_t1_shield_gamma_set ;

--
-- VHDL Architecture alien_game_lib.c5_t1_shield_gamma_set.fsm
--
-- Created:
--          by - Thinkpad X1.UNKNOWN (LENOVO-PC)
--          at - 23:06:58 11/20/2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
 
ARCHITECTURE fsm OF c5_t1_shield_gamma_set IS

   -- Architecture Declarations
   SIGNAL data : std_logic_vector(17 DOWNTO 0);  
   SIGNAL index : integer RANGE 17 DOWNTO 0 := 0;  

   TYPE STATE_TYPE IS (
      start,
      sel_outbit,
      increment_index,
      set_sb,
      set_lat
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
         -- Default Assignment To Internals
         data <= "111011111111001110";

         -- Combined Actions
         CASE current_state IS
            WHEN increment_index => 
               index <= index +1;
            WHEN OTHERS =>
               NULL;
         END CASE;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      current_state,
      index,
      rx_rdy
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN start => 
            IF (rx_rdy = '1' AND index < 18) THEN 
               next_state <= sel_outbit;
            ELSIF (index = 18) THEN 
               next_state <= set_sb;
            ELSE
               next_state <= start;
            END IF;
         WHEN sel_outbit => 
            next_state <= increment_index;
         WHEN increment_index => 
            next_state <= start;
         WHEN set_sb => 
            IF (rx_rdy = '0') THEN 
               next_state <= set_lat;
            ELSE
               next_state <= set_sb;
            END IF;
         WHEN set_lat => 
            next_state <= start;
         WHEN OTHERS =>
            next_state <= start;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state,
      data,
      index
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      lat <= '0';
      sb <= '0';
      transmit <= '0';

      -- Combined Actions
      CASE current_state IS
         WHEN sel_outbit => 
            transmit <= '1';
             bit_out <= data(index);
         WHEN set_sb => 
            sb <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;