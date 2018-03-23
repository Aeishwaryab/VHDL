----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2018 12:19:09
-- Design Name: 
-- Module Name: GenAnd - DoAnd
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
use IEEE.NUMERIC_STD.ALL;
------------------------------
------------------------------
package baseLogic is
    component GenAnd
        generic(size:integer:=2);
        Port ( Inp: in STD_LOGIC_VECTOR(size-1 downto 0); 
                res: out STD_LOGIC );
    end component;
end baseLogic;
------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity GenAnd is
  generic(size:integer:=2);
  Port ( Inp: in STD_LOGIC_VECTOR(size-1 downto 0); 
         res: out STD_LOGIC );
end GenAnd;

architecture DoAnd of GenAnd is
signal s: STD_LOGIC_VECTOR(size-2 downto 0);
begin  
process(Inp, s)
begin
    s(0) <= Inp(0) AND Inp(1);
    if (size > 2) then
       for i in 1 to size-2 loop
                s(i) <= s(i-1) AND Inp(i+1);
       end loop;
    end if;
    res <= s(size-2);
end process;        
end DoAnd;
