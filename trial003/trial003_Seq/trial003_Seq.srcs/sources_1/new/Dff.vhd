----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.03.2018 15:55:44
-- Design Name: 
-- Module Name: Dff - Dlatch
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
use work.CompLog.ALL ;
use work.SRff.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
------------
-- D LATCH Flip Flop using concurrent statements.
------------
entity Dff is
      Port ( CLK ,D: in STD_LOGIC ; 
             Q1, Qo1 : inout STD_LOGIC );
end Dff;

architecture Dlatch of Dff is
signal Dnot,l,k: STD_LOGIC ;
signal s1, s2: STD_LOGIC_VECTOR(1 downto 0);
begin
    process(CLK)
    begin
       
    end process;
end Dlatch;
