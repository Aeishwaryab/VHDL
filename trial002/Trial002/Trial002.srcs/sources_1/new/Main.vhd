----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.03.2018 12:55:59
-- Design Name: 
-- Module Name: Main - combine
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use work.baseLogic.ALL;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Main is
    Port ( d1 : in STD_LOGIC;
           d2 : in STD_LOGIC;
           d3 : in STD_LOGIC;
           d4 : in STD_LOGIC;
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           d5 : in STD_LOGIC;
           t : out STD_LOGIC;
           o1 : out STD_LOGIC;
           o2 : out STD_LOGIC;
           o3 : out STD_LOGIC;
           o4 : out STD_LOGIC);
end Main;

architecture combine of Main is
component Demux port (A : in STD_LOGIC;
           So : in STD_LOGIC;
           S1 : in STD_LOGIC;
           O0 : out STD_LOGIC;
           O1 : out STD_LOGIC;
           O2 : out STD_LOGIC;
           O3 : out STD_LOGIC);
end component;
component Mux port (In0, In1, In2, In3, So, S1 : in STD_LOGIC;
           Op : out STD_LOGIC);
end component;
begin
M: Mux port map (d1, d2,d3,d4,s0,s1,t);
D: Demux port map(d5, s0,s1,o1,o2,o3,o4);

end combine;
