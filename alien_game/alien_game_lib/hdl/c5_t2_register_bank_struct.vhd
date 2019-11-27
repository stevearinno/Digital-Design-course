-- VHDL Entity alien_game_lib.c5_t2_register_bank.symbol
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-709-SPC)
--          at - 15:01:33 27.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c5_t2_register_bank IS
   PORT( 
      clk        : IN     std_logic;
      frame_done : IN     std_logic;
      pixd_in    : IN     std_logic_vector (23 DOWNTO 0);
      rst_n      : IN     std_logic;
      write      : IN     std_logic;
      xr         : IN     std_logic_vector (7 DOWNTO 0);
      xw         : IN     std_logic_vector (7 DOWNTO 0);
      yr         : IN     std_logic_vector (7 DOWNTO 0);
      yw         : IN     std_logic_vector (7 DOWNTO 0);
      pixd_out   : OUT    std_logic_vector (23 DOWNTO 0);
      w_rdy      : OUT    std_logic
   );

-- Declarations

END c5_t2_register_bank ;

--
-- VHDL Architecture alien_game_lib.c5_t2_register_bank.struct
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-709-SPC)
--          at - 15:52:59 27.11.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY alien_game_lib;

ARCHITECTURE struct OF c5_t2_register_bank IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL dout      : std_logic;
   SIGNAL dout1     : std_logic;
   SIGNAL dout10    : std_logic;
   SIGNAL dout11    : std_logic;
   SIGNAL dout12    : std_logic;
   SIGNAL dout13    : std_logic;
   SIGNAL dout14    : std_logic;
   SIGNAL dout15    : std_logic;
   SIGNAL dout2     : std_logic;
   SIGNAL dout3     : std_logic;
   SIGNAL dout4     : std_logic;
   SIGNAL dout5     : std_logic;
   SIGNAL dout6     : std_logic;
   SIGNAL dout7     : std_logic;
   SIGNAL dout8     : std_logic;
   SIGNAL dout9     : std_logic;
   SIGNAL nullify   : std_logic;
   SIGNAL pixd_out1 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out2 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out3 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out4 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out5 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out6 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out7 : std_logic_vector(23 DOWNTO 0);
   SIGNAL pixd_out8 : std_logic_vector(23 DOWNTO 0);
   SIGNAL read_en   : std_logic;
   SIGNAL yr_mux    : std_logic_vector(7 DOWNTO 0);


   -- Component Declarations
   COMPONENT c5_t2_register_row
   PORT (
      clk      : IN     std_logic ;
      nullify  : IN     std_logic ;
      pixd_in  : IN     std_logic_vector (23 DOWNTO 0);
      read_en  : IN     std_logic ;
      rst_n    : IN     std_logic ;
      write    : IN     std_logic ;
      xr       : IN     std_logic_vector (7 DOWNTO 0);
      xw       : IN     std_logic_vector (7 DOWNTO 0);
      pixd_out : OUT    std_logic_vector (23 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT c5_t2_register_state
   PORT (
      clk        : IN     std_logic ;
      frame_done : IN     std_logic ;
      rst_n      : IN     std_logic ;
      nullify    : OUT    std_logic ;
      read_en    : OUT    std_logic ;
      w_rdy      : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : c5_t2_register_row USE ENTITY alien_game_lib.c5_t2_register_row;
   FOR ALL : c5_t2_register_state USE ENTITY alien_game_lib.c5_t2_register_state;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_8' of 'and'
   dout <= yw(7) AND write;

   -- ModuleWare code(v1.12) for instance 'U_9' of 'and'
   dout1 <= yw(6) AND write;

   -- ModuleWare code(v1.12) for instance 'U_10' of 'and'
   dout2 <= yw(5) AND write;

   -- ModuleWare code(v1.12) for instance 'U_11' of 'and'
   dout3 <= yw(4) AND write;

   -- ModuleWare code(v1.12) for instance 'U_12' of 'and'
   dout4 <= yw(3) AND write;

   -- ModuleWare code(v1.12) for instance 'U_13' of 'and'
   dout5 <= yw(2) AND write;

   -- ModuleWare code(v1.12) for instance 'U_14' of 'and'
   dout6 <= yw(1) AND write;

   -- ModuleWare code(v1.12) for instance 'U_15' of 'and'
   dout7 <= yw(0) AND write;

   -- ModuleWare code(v1.12) for instance 'U_18' of 'and'
   dout8 <= yr_mux(0) AND nullify;

   -- ModuleWare code(v1.12) for instance 'U_19' of 'and'
   dout9 <= yr_mux(1) AND nullify;

   -- ModuleWare code(v1.12) for instance 'U_20' of 'and'
   dout10 <= yr_mux(2) AND nullify;

   -- ModuleWare code(v1.12) for instance 'U_21' of 'and'
   dout11 <= yr_mux(3) AND nullify;

   -- ModuleWare code(v1.12) for instance 'U_22' of 'and'
   dout12 <= yr_mux(4) AND nullify;

   -- ModuleWare code(v1.12) for instance 'U_23' of 'and'
   dout13 <= yr_mux(5) AND nullify;

   -- ModuleWare code(v1.12) for instance 'U_24' of 'and'
   dout14 <= yr_mux(6) AND nullify;

   -- ModuleWare code(v1.12) for instance 'U_25' of 'and'
   dout15 <= yr_mux(7) AND nullify;

   -- ModuleWare code(v1.12) for instance 'U_26' of 'mux'
   u_26combo_proc: PROCESS(yr, read_en)
   BEGIN
      CASE read_en IS
      WHEN '0' => yr_mux <= yr;
      WHEN '1' => yr_mux <= yr;
      WHEN OTHERS => yr_mux <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_26combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_16' of 'omux'
   u_16combo_proc: PROCESS(pixd_out1, pixd_out2, pixd_out3, pixd_out4, 
                           pixd_out5, pixd_out6, pixd_out7, pixd_out8, 
                           yr_mux)
   BEGIN
      pixd_out <= (OTHERS => 'X');
      CASE yr_mux IS
      WHEN "00000001" => pixd_out <= pixd_out1;
      WHEN "00000010" => pixd_out <= pixd_out2;
      WHEN "00000100" => pixd_out <= pixd_out3;
      WHEN "00001000" => pixd_out <= pixd_out4;
      WHEN "00010000" => pixd_out <= pixd_out5;
      WHEN "00100000" => pixd_out <= pixd_out6;
      WHEN "01000000" => pixd_out <= pixd_out7;
      WHEN "10000000" => pixd_out <= pixd_out8;
      WHEN OTHERS => pixd_out <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_16combo_proc;

   -- Instance port mappings.
   U_0 : c5_t2_register_row
      PORT MAP (
         clk      => clk,
         nullify  => dout8,
         pixd_in  => pixd_in,
         read_en  => read_en,
         rst_n    => rst_n,
         write    => dout7,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out1
      );
   U_1 : c5_t2_register_row
      PORT MAP (
         clk      => clk,
         nullify  => dout9,
         pixd_in  => pixd_in,
         read_en  => read_en,
         rst_n    => rst_n,
         write    => dout6,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out2
      );
   U_2 : c5_t2_register_row
      PORT MAP (
         clk      => clk,
         nullify  => dout10,
         pixd_in  => pixd_in,
         read_en  => read_en,
         rst_n    => rst_n,
         write    => dout5,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out3
      );
   U_3 : c5_t2_register_row
      PORT MAP (
         clk      => clk,
         nullify  => dout11,
         pixd_in  => pixd_in,
         read_en  => read_en,
         rst_n    => rst_n,
         write    => dout4,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out4
      );
   U_4 : c5_t2_register_row
      PORT MAP (
         clk      => clk,
         nullify  => dout12,
         pixd_in  => pixd_in,
         read_en  => read_en,
         rst_n    => rst_n,
         write    => dout3,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out5
      );
   U_5 : c5_t2_register_row
      PORT MAP (
         clk      => clk,
         nullify  => dout13,
         pixd_in  => pixd_in,
         read_en  => read_en,
         rst_n    => rst_n,
         write    => dout2,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out6
      );
   U_6 : c5_t2_register_row
      PORT MAP (
         clk      => clk,
         nullify  => dout14,
         pixd_in  => pixd_in,
         read_en  => read_en,
         rst_n    => rst_n,
         write    => dout1,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out7
      );
   U_7 : c5_t2_register_row
      PORT MAP (
         clk      => clk,
         nullify  => dout15,
         pixd_in  => pixd_in,
         read_en  => read_en,
         rst_n    => rst_n,
         write    => dout,
         xr       => xr,
         xw       => xw,
         pixd_out => pixd_out8
      );
   U_17 : c5_t2_register_state
      PORT MAP (
         clk        => clk,
         frame_done => frame_done,
         rst_n      => rst_n,
         nullify    => nullify,
         read_en    => read_en,
         w_rdy      => w_rdy
      );

END struct;
