-- VHDL Entity alien_game_lib.c1_t1_half_adder.symbol
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-708-SPC)
--          at - 13:56:30 26.09.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY c1_t1_half_adder IS
   PORT( 
      sw0   : IN     std_logic;
      sw1   : IN     std_logic;
      carry : OUT    std_logic;
      sum   : OUT    std_logic
   );

-- Declarations

END c1_t1_half_adder ;

--
-- VHDL Architecture alien_game_lib.c1_t1_half_adder.struct
--
-- Created:
--          by - wirdatma.UNKNOWN (HTC219-708-SPC)
--          at - 14:29:30 26.09.2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2019.3 (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF c1_t1_half_adder IS

   -- Architecture declarations

   -- Internal signal declarations



BEGIN

   -- ModuleWare code(v1.12) for instance 'U_0' of 'and'
   carry <= sw0 AND sw1;

   -- ModuleWare code(v1.12) for instance 'U_1' of 'xor'
   sum <= sw0 XOR sw1;

   -- Instance port mappings.

END struct;
