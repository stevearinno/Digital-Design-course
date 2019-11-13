-- VHDL Entity alien_game_lib.c2_t7_basic_alien.symbol
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-714-SPC)
--          at - 13:59:09 13.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c2_t7_basic_alien IS
   PORT( 
      clock          : IN     std_logic;
      enable         : IN     std_logic;
      hit            : IN     std_logic;
      rst_n          : IN     std_logic;
      alien_color    : OUT    std_logic_vector (23 DOWNTO 0);
      alien_defeated : OUT    std_logic;
      x_coord        : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord        : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END c2_t7_basic_alien ;

--
-- VHDL Architecture alien_game_lib.c2_t7_basic_alien.struct
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-706-SPC)
--          at - 14:59:51 13.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c2_t7_basic_alien IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL hit_count : std_logic_vector(1 DOWNTO 0);

   -- Implicit buffer signal declarations
   SIGNAL alien_color_internal    : std_logic_vector (23 DOWNTO 0);
   SIGNAL alien_defeated_internal : std_logic;


   -- Component Declarations
   COMPONENT c2_t7_color
   PORT (
      clk         : IN     std_logic ;
      hit_count   : IN     std_logic_vector (1 DOWNTO 0);
      rst_n       : IN     std_logic ;
      alien_color : OUT    std_logic_vector (23 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c2_t7_coordinate
   PORT (
      alien_defeated : IN     std_logic ;
      clock          : IN     std_logic ;
      en             : IN     std_logic ;
      hit            : IN     std_logic ;
      lvl3           : IN     std_logic ;
      rst_n          : IN     std_logic ;
      x_coord        : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord        : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c4_t3_hit_counter
   PORT (
      clk       : IN     std_logic ;
      hit       : IN     std_logic ;
      rst_n     : IN     std_logic ;
      hit_count : OUT    std_logic_vector (1 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c2_t7_color USE ENTITY alien_game_lib.c2_t7_color;
   FOR ALL : c2_t7_coordinate USE ENTITY alien_game_lib.c2_t7_coordinate;
   FOR ALL : c4_t3_hit_counter USE ENTITY alien_game_lib.c4_t3_hit_counter;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_5' of 'and'
   alien_defeated_internal <= NOT(alien_color_internal(23))
                              AND NOT(alien_color_internal(0));

   -- Instance port mappings.
   U_1 : c2_t7_color
      PORT MAP (
         clk         => clock,
         hit_count   => hit_count,
         rst_n       => rst_n,
         alien_color => alien_color_internal
      );
   U_0 : c2_t7_coordinate
      PORT MAP (
         alien_defeated => alien_defeated_internal,
         clock          => clock,
         en             => enable,
         hit            => hit,
         lvl3           => hit_count(1),
         rst_n          => rst_n,
         x_coord        => x_coord,
         y_coord        => y_coord
      );
   U_6 : c4_t3_hit_counter
      PORT MAP (
         clk       => clock,
         hit       => hit,
         rst_n     => rst_n,
         hit_count => hit_count
      );

   -- Implicit buffered output assignments
   alien_color    <= alien_color_internal;
   alien_defeated <= alien_defeated_internal;

END struct;
