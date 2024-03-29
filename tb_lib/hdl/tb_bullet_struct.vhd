-- VHDL Entity tb_lib.tb_bullet.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-706-SPC)
--          at - 13:40:19 05/31/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_bullet IS
-- Declarations

END tb_bullet ;

--
-- VHDL Architecture tb_lib.tb_bullet.struct
--
-- Created:
--          by - Thinkpad X1.UNKNOWN (LENOVO-PC)
--          at - 19:01:31 10/24/2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_bullet IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL btn           : std_logic_vector(3 DOWNTO 0);
   SIGNAL bullet_colour : std_logic_vector(23 DOWNTO 0);
   SIGNAL bullet_x      : std_logic_vector(7 DOWNTO 0);
   SIGNAL bullet_y      : std_logic_vector(7 DOWNTO 0);
   SIGNAL clk           : std_logic;
   SIGNAL en            : std_logic;
   SIGNAL gun_x         : std_logic_vector(7 DOWNTO 0);
   SIGNAL rst_n         : std_logic;


   -- Component Declarations
   COMPONENT c3_t4_bullet_flight
   PORT (
      btn           : IN     std_logic_vector (3 DOWNTO 0);
      clk           : IN     std_logic ;
      en            : IN     std_logic ;
      gun_x         : IN     std_logic_vector (7 DOWNTO 0);
      rst_n         : IN     std_logic ;
      bullet_colour : OUT    std_logic_vector (23 DOWNTO 0);
      bullet_x      : OUT    std_logic_vector (7 DOWNTO 0);
      bullet_y      : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT bullet_test_block
   PORT (
      bullet_colour : IN     std_logic_vector (23 DOWNTO 0);
      bullet_x      : IN     std_logic_vector (7 DOWNTO 0);
      bullet_y      : IN     std_logic_vector (7 DOWNTO 0);
      btn           : OUT    std_logic_vector (3 DOWNTO 0);
      clk           : OUT    std_logic;
      en            : OUT    std_logic;
      gun_x         : OUT    std_logic_vector (7 DOWNTO 0);
      rst_n         : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : bullet_test_block USE ENTITY tb_lib.bullet_test_block;
   FOR ALL : c3_t4_bullet_flight USE ENTITY alien_game_lib.c3_t4_bullet_flight;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : c3_t4_bullet_flight
      PORT MAP (
         btn           => btn,
         clk           => clk,
         en            => en,
         gun_x         => gun_x,
         rst_n         => rst_n,
         bullet_colour => bullet_colour,
         bullet_x      => bullet_x,
         bullet_y      => bullet_y
      );
   U_0 : bullet_test_block
      PORT MAP (
         gun_x         => gun_x,
         clk           => clk,
         rst_n         => rst_n,
         btn           => btn,
         en            => en,
         bullet_x      => bullet_x,
         bullet_y      => bullet_y,
         bullet_colour => bullet_colour
      );

END struct;
