----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.03.2018 15:40:08
-- Design Name: 
-- Module Name: SR - latch
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
package SRff is 
    component SR
     --generic(size:integer:=2);
     Port (     S : in STD_LOGIC;
                R : in STD_LOGIC;
                Q : inout STD_LOGIC;
                Qo : inout STD_LOGIC);
    end component;
end SRff;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SR is
    Port ( S : in STD_LOGIC;
           R : in STD_LOGIC;
           Q : inout STD_LOGIC;
           Qo : inout STD_LOGIC);
end SR;

architecture latch of SR is

begin
Q <= R NOR Qo ;
Qo <= S NOR Q ;
end latch;


