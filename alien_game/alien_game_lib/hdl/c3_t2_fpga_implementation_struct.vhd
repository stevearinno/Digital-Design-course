-- VHDL Entity alien_game_lib.c3_t2_fpga_implementation.symbol
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-709-SPC)
--          at - 15:51:49 22.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c3_t2_fpga_implementation IS
   PORT( 
      btn            : IN     std_logic_vector (3 DOWNTO 0);
      clk            : IN     std_logic;
      rst_n          : IN     std_logic;
      if_you_name    : OUT    std_logic_vector (7 DOWNTO 0);
      iotre_will     : OUT    std_logic;
      like_this      : OUT    std_logic;
      of_this_course : OUT    std_logic;
      throw_you_out  : OUT    std_logic;
      your_signals   : OUT    std_logic
   );

-- Declarations

END c3_t2_fpga_implementation ;

--
-- VHDL Architecture alien_game_lib.c3_t2_fpga_implementation.struct
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-716-SPC)
--          at - 16:29:20 29.10.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;
LIBRARY pre_made;

ARCHITECTURE struct OF c3_t2_fpga_implementation IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL color_BGR  : std_logic_vector(23 DOWNTO 0);
   SIGNAL frame_done : std_logic;
   SIGNAL w_rdy      : std_logic;
   SIGNAL write      : std_logic;
   SIGNAL x_coord2   : std_logic_vector(7 DOWNTO 0);
   SIGNAL y_coord2   : std_logic_vector(7 DOWNTO 0);


   -- Component Declarations
   COMPONENT c3_t2_writer_seq_top_level
   PORT (
      btn         : IN     std_logic_vector (3 DOWNTO 0);
      clk         : IN     std_logic ;
      rst_n       : IN     std_logic ;
      write_ready : IN     std_logic ;
      color_BGR   : OUT    std_logic_vector (23 DOWNTO 0);
      frame_done  : OUT    std_logic ;
      write       : OUT    std_logic ;
      x_coord2    : OUT    std_logic_vector (7 DOWNTO 0);
      y_coord2    : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT z_black_box_y
   PORT (
      clk            : IN     std_logic;
      color_BGR      : IN     std_logic_vector (23 DOWNTO 0);
      frame_done     : IN     std_logic;
      rst_n          : IN     std_logic;
      write          : IN     std_logic;
      x_coord        : IN     std_logic_vector (7 DOWNTO 0);
      y_coord        : IN     std_logic_vector (7 DOWNTO 0);
      if_you_name    : OUT    std_logic_vector (7 DOWNTO 0);
      iotre_will     : OUT    std_logic;
      like_this      : OUT    std_logic;
      of_this_course : OUT    std_logic;
      throw_you_out  : OUT    std_logic;
      w_rdy          : OUT    std_logic;
      your_signals   : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c3_t2_writer_seq_top_level USE ENTITY alien_game_lib.c3_t2_writer_seq_top_level;
   FOR ALL : z_black_box_y USE ENTITY pre_made.z_black_box_y;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : c3_t2_writer_seq_top_level
      PORT MAP (
         btn         => btn,
         clk         => clk,
         rst_n       => rst_n,
         write_ready => w_rdy,
         color_BGR   => color_BGR,
         frame_done  => frame_done,
         write       => write,
         x_coord2    => x_coord2,
         y_coord2    => y_coord2
      );
   U_7 : z_black_box_y
      PORT MAP (
         clk            => clk,
         color_BGR      => color_BGR,
         frame_done     => frame_done,
         rst_n          => rst_n,
         write          => write,
         x_coord        => x_coord2,
         y_coord        => y_coord2,
         if_you_name    => if_you_name,
         iotre_will     => iotre_will,
         like_this      => like_this,
         of_this_course => of_this_course,
         throw_you_out  => throw_you_out,
         w_rdy          => w_rdy,
         your_signals   => your_signals
      );

END struct;
