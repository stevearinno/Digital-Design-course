-- VHDL Entity tb_lib.tb_basic_alien.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-712-SPC)
--          at - 15:04:21 08/16/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_basic_alien IS
-- Declarations

END tb_basic_alien ;

--
-- VHDL Architecture tb_lib.tb_basic_alien.struct
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-712-SPC)
--          at - 15:49:16  5.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_basic_alien IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL clk           : std_logic;
   SIGNAL duv_color_out : std_logic_vector(23 DOWNTO 0);
   SIGNAL duv_x_out     : std_logic_vector(7 DOWNTO 0);
   SIGNAL duv_y_out     : std_logic_vector(7 DOWNTO 0);
   SIGNAL en            : std_logic;
   SIGNAL hit           : std_logic;
   SIGNAL rst_n         : std_logic;


   -- Component Declarations
   COMPONENT c2_t7_basic_alien
   PORT (
      clock          : IN     std_logic ;
      enable         : IN     std_logic ;
      hit            : IN     std_logic ;
      rst_n          : IN     std_logic ;
      alien_color    : OUT    std_logic_vector (23 DOWNTO 0);
      alien_defeated : OUT    std_logic_vector (23 DOWNTO 0);
      x_coord        : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord        : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT basic_alien_tester
   PORT (
      duv_color_out : IN     std_logic_vector (23 DOWNTO 0);
      duv_x_out     : IN     std_logic_vector (7 DOWNTO 0);
      duv_y_out     : IN     std_logic_vector (7 DOWNTO 0);
      clk           : OUT    std_logic;
      en            : OUT    std_logic;
      hit           : OUT    std_logic;
      rst_n         : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : basic_alien_tester USE ENTITY tb_lib.basic_alien_tester;
   FOR ALL : c2_t7_basic_alien USE ENTITY alien_game_lib.c2_t7_basic_alien;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : c2_t7_basic_alien
      PORT MAP (
         clock          => clk,
         enable         => en,
         hit            => hit,
         rst_n          => rst_n,
         alien_color    => duv_color_out,
         alien_defeated => OPEN,
         x_coord        => duv_x_out,
         y_coord        => duv_y_out
      );
   U_0 : basic_alien_tester
      PORT MAP (
         duv_x_out     => duv_x_out,
         duv_y_out     => duv_y_out,
         duv_color_out => duv_color_out,
         clk           => clk,
         en            => en,
         rst_n         => rst_n,
         hit           => hit
      );

END struct;
