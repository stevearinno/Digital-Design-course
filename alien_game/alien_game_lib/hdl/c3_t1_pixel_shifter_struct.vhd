-- VHDL Entity alien_game_lib.c3_t1_pixel_shifter.symbol
--
-- Created:
--          by - Thinkpad X1.UNKNOWN (LENOVO-PC)
--          at - 09:13:23 10/16/2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c3_t1_pixel_shifter IS
   PORT( 
      end_sel   : IN     std_logic;
      pixel_in  : IN     std_logic_vector (7 DOWNTO 0);
      selector  : IN     std_logic_vector (1 DOWNTO 0);
      pixel_out : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c3_t1_pixel_shifter ;

--
-- VHDL Architecture alien_game_lib.c3_t1_pixel_shifter.struct
--
-- Created:
--          by - Thinkpad X1.UNKNOWN (LENOVO-PC)
--          at - 09:13:23 10/16/2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c3_t1_pixel_shifter IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL dout            : std_logic_vector(7 DOWNTO 0);
   SIGNAL out_left_shift  : std_logic_vector(7 DOWNTO 0);
   SIGNAL out_right_shift : std_logic_vector(7 DOWNTO 0);


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

   -- ModuleWare code(v1.12) for instance 'U_2' of 'mux'
   u_2combo_proc: PROCESS(pixel_in, out_right_shift, out_left_shift, 
                          selector)
   BEGIN
      CASE selector IS
      WHEN "00" => dout <= pixel_in;
      WHEN "01" => dout <= out_right_shift;
      WHEN "10" => dout <= out_left_shift;
      WHEN "11" => dout <= pixel_in;
      WHEN OTHERS => dout <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_2combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'mux'
   u_3combo_proc: PROCESS(dout, pixel_in, end_sel)
   BEGIN
      CASE end_sel IS
      WHEN '0' => pixel_out <= dout;
      WHEN '1' => pixel_out <= pixel_in;
      WHEN OTHERS => pixel_out <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_3combo_proc;

   -- Instance port mappings.
   U_1 : c2_t3_left_shifter
      PORT MAP (
         in_left_shift  => pixel_in,
         out_left_shift => out_left_shift
      );
   U_0 : c2_t4_right_shifter
      PORT MAP (
         in_right_shift  => pixel_in,
         out_right_shift => out_right_shift
      );

END struct;
