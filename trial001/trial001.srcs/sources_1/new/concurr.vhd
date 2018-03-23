----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2018 15:42:39
-- Design Name: 
-- Module Name: concurr - testConcurr
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

entity concurr is
    Port ( a1 : in STD_LOGIC;
           b1 : in STD_LOGIC;
           c1 : in STD_LOGIC;
           d1 : inout STD_LOGIC;
           x : out STD_LOGIC);
end concurr;

architecture testConcurr of concurr is

begin
    x <= d1 AND c1 ;
    d1 <= a1 OR b1 ; 
end testConcurr;
