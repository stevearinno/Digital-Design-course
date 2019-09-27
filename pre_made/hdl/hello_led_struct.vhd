-- VHDL Entity pre_made.HELLO_LED.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-712-SPC)
--          at - 10:38:18 07/30/18
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY HELLO_LED IS
   PORT( 
      btn            : IN     std_logic_vector (3 DOWNTO 0);
      clk            : IN     std_logic;
      rst_n          : IN     std_logic;
      sw0            : IN     std_logic;
      if_you_name    : OUT    std_logic_vector (7 DOWNTO 0);
      iotre_will     : OUT    std_logic;
      like_this      : OUT    std_logic;
      of_this_course : OUT    std_logic;
      throw_you_out  : OUT    std_logic;
      your_signals   : OUT    std_logic
   );

-- Declarations

END HELLO_LED ;

--
-- VHDL Architecture pre_made.HELLO_LED.struct
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-712-SPC)
--          at - 14:16:10 27.09.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;
LIBRARY pre_made;

ARCHITECTURE struct OF HELLO_LED IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL color   : std_logic_vector(23 DOWNTO 0);
   SIGNAL x_coord : std_logic_vector(7 DOWNTO 0);
   SIGNAL y_coord : std_logic_vector(7 DOWNTO 0);


   -- Component Declarations
   COMPONENT c1_t3c_hello_led
   PORT (
      btn       : IN     std_logic_vector (3 DOWNTO 0);
      sw0       : IN     std_logic ;
      color_BGR : OUT    std_logic_vector (23 DOWNTO 0);
      x_coord   : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord   : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT z_black_box
   PORT (
      clk            : IN     std_logic;
      color_BGR      : IN     std_logic_vector (23 DOWNTO 0);
      rst_n          : IN     std_logic;
      x_coord        : IN     std_logic_vector (7 DOWNTO 0);
      y_coord        : IN     std_logic_vector (7 DOWNTO 0);
      if_you_name    : OUT    std_logic_vector (7 DOWNTO 0);
      iotre_will     : OUT    std_logic;
      like_this      : OUT    std_logic;
      of_this_course : OUT    std_logic;
      throw_you_out  : OUT    std_logic;
      your_signals   : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c1_t3c_hello_led USE ENTITY alien_game_lib.c1_t3c_hello_led;
   FOR ALL : z_black_box USE ENTITY pre_made.z_black_box;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : c1_t3c_hello_led
      PORT MAP (
         btn       => btn,
         sw0       => sw0,
         color_BGR => color,
         x_coord   => x_coord,
         y_coord   => y_coord
      );
   U_0 : z_black_box
      PORT MAP (
         clk            => clk,
         color_BGR      => color,
         rst_n          => rst_n,
         x_coord        => x_coord,
         y_coord        => y_coord,
         if_you_name    => if_you_name,
         iotre_will     => iotre_will,
         like_this      => like_this,
         of_this_course => of_this_course,
         throw_you_out  => throw_you_out,
         your_signals   => your_signals
      );

END struct;
