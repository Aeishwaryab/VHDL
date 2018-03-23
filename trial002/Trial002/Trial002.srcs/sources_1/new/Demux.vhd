----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.03.2018 11:54:05
-- Design Name: 
-- Module Name: Demux - DeSel
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Demux is
    Port ( A : in STD_LOGIC;
           So : in STD_LOGIC;
           S1 : in STD_LOGIC;
           O0 : out STD_LOGIC;
           O1 : out STD_LOGIC;
           O2 : out STD_LOGIC;
           O3 : out STD_LOGIC);
end Demux;

architecture DeSel of Demux is
component In3And port (a,b,c: in STD_LOGIC; 
                       x: out STD_LOGIC);
end component;
signal SoNot, S1Not: STD_LOGIC ;
begin
SoNot <= NOT So;
S1Not <= NOT S1;
OP0 : In3And port map (A, SoNOT, S1Not, O0);
OP1 : In3And port map (A, So, S1Not, O1);
OP2 : In3And port map (A, SoNOT, S1, O2);
OP3 : In3And port map (A, So, S1, O3);
end DeSel;
