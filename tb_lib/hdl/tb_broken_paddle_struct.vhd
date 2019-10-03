-- VHDL Entity tb_lib.tb_broken_paddle.symbol
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-714-SPC)
--          at - 11:11:44 09/12/19
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY tb_broken_paddle IS
-- Declarations

END tb_broken_paddle ;

--
-- VHDL Architecture tb_lib.tb_broken_paddle.struct
--
-- Created:
--          by - kayra.UNKNOWN (HTC219-714-SPC)
--          at - 13:49:50 09/12/19
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY pre_made;
LIBRARY tb_lib;

ARCHITECTURE struct OF tb_broken_paddle IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL btn     : std_logic_vector(3 DOWNTO 0);
   SIGNAL clk     : std_logic;
   SIGNAL rst_n   : std_logic;
   SIGNAL w_rdy   : std_logic;
   SIGNAL write   : std_logic;
   SIGNAL x_coord : std_logic_vector(7 DOWNTO 0);


   -- Component Declarations
   COMPONENT broken_paddle
   PORT (
      btn     : IN     std_logic_vector (3 DOWNTO 0);
      clk     : IN     std_logic ;
      rst_n   : IN     std_logic ;
      w_rdy   : IN     std_logic ;
      write   : OUT    std_logic ;
      x_coord : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT broken_paddle_tester
   PORT (
      write   : IN     std_logic;
      x_coord : IN     std_logic_vector (7 DOWNTO 0);
      btn     : OUT    std_logic_vector (3 DOWNTO 0);
      clk     : OUT    std_logic;
      rst_n   : OUT    std_logic;
      w_rdy   : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : broken_paddle USE ENTITY pre_made.broken_paddle;
   FOR ALL : broken_paddle_tester USE ENTITY tb_lib.broken_paddle_tester;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : broken_paddle
      PORT MAP (
         btn     => btn,
         clk     => clk,
         rst_n   => rst_n,
         w_rdy   => w_rdy,
         write   => write,
         x_coord => x_coord
      );
   U_1 : broken_paddle_tester
      PORT MAP (
         write   => write,
         x_coord => x_coord,
         btn     => btn,
         clk     => clk,
         rst_n   => rst_n,
         w_rdy   => w_rdy
      );

END struct;
