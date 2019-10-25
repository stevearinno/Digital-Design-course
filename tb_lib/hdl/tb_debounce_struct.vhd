-- VHDL Entity tb_lib.tb_debounce.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-706-SPC)
--          at - 13:47:36 07/27/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_debounce IS
-- Declarations

END tb_debounce ;

--
-- VHDL Architecture tb_lib.tb_debounce.struct
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-708-SPC)
--          at - 15:19:05 24.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_debounce IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL btn_out       : std_logic;
   SIGNAL button_to_DUV : std_logic;
   SIGNAL clk           : std_logic;
   SIGNAL rst_n         : std_logic;


   -- Component Declarations
   COMPONENT c3_t3_button_debounce
   PORT (
      btn_in  : IN     std_logic ;
      clk     : IN     std_logic ;
      rst_n   : IN     std_logic ;
      btn_out : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT debounce_tester
   PORT (
      button_from_duv : IN     std_logic;
      button_to_DUV   : OUT    std_logic;
      clk             : OUT    std_logic;
      rst_n           : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c3_t3_button_debounce USE ENTITY alien_game_lib.c3_t3_button_debounce;
   FOR ALL : debounce_tester USE ENTITY tb_lib.debounce_tester;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : c3_t3_button_debounce
      PORT MAP (
         btn_in  => button_to_DUV,
         clk     => clk,
         rst_n   => rst_n,
         btn_out => btn_out
      );
   U_0 : debounce_tester
      PORT MAP (
         button_from_duv => btn_out,
         button_to_DUV   => button_to_DUV,
         clk             => clk,
         rst_n           => rst_n
      );

END struct;
