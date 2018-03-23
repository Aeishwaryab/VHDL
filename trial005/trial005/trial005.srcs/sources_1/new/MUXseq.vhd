----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.03.2018 17:07:55
-- Design Name: 
-- Module Name: MUXseq - Sel
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

entity MUXseq is
    Port ( d1,d2,d3,d4,clr,s0,s1 : in STD_LOGIC;
           o : out STD_LOGIC);
end MUXseq;

architecture Sel of MUXseq is
begin
process(s0,s1,d1,d2,d3,d4,clr)
    begin
        if clr = '0' then
            o <= '0' ;
        elsif s0 = '0' AND s1 = '0' then
            o <= d1 ;
        elsif s0 = '1' AND s1 = '0' then
            o <= d2;
        elsif  s0 = '0' AND s1 ='1' then
            o <= d3;
        elsif s0 = '1' AND s1='1' then
            o <= d4;
        end if;
end process;
end Sel;
