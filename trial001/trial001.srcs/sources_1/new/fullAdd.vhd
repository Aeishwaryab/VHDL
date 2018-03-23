----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2018 16:09:15
-- Design Name: 
-- Module Name: fullAdd - bit4Add
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

entity fullAdd is
    Port ( A, B, Ci : in STD_LOGIC;
           S,Co : out STD_LOGIC);
end fullAdd;

architecture ADD of fullAdd is
begin
    S <= A XOR B XOR Ci;
    Co <= (A AND B) OR (A AND Ci) OR (B AND Ci) ;    
end ADD;
