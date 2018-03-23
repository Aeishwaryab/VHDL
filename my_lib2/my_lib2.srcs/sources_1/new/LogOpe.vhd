----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2018 18:34:51
-- Design Name: 
-- Module Name: LogOpe - And
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
package CompLog is 
    component LogOpe
     generic(size:integer:=2);
     Port ( Inp: in STD_LOGIC_VECTOR(size-1 downto 0); 
         res: out STD_LOGIC );
    end component;
end CompLog;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LogOpe is
generic(size:integer:=2);
  Port ( Inp: in STD_LOGIC_VECTOR(size-1 downto 0); 
         res: out STD_LOGIC );
end LogOpe;

architecture AndEle of LogOpe is
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
end AndEle;

--architecture OrEle of LogOpe is
--signal s: STD_LOGIC_VECTOR(size-2 downto 0);
--begin  
--process(Inp, s)
--begin
--    s(0) <= Inp(0) OR Inp(1);
--    if (size > 2) then
--       for i in 1 to size-2 loop
--                s(i) <= s(i-1) OR Inp(i+1);
--       end loop;
--    end if;
--    res <= s(size-2);
--end process;        
--end OrEle;

--architecture XorEle of LogOpe is
--signal s: STD_LOGIC_VECTOR(size-2 downto 0);
--begin  
--process(Inp, s)
--begin
--    s(0) <= Inp(0) XOR Inp(1);
--    if (size > 2) then
--       for i in 1 to size-2 loop
--                s(i) <= s(i-1) XOR Inp(i+1);
--       end loop;
--    end if;
--    res <= s(size-2);
--end process;        
--end XorEle;

--architecture NorEle of LogOpe is
--signal s: STD_LOGIC_VECTOR(size-2 downto 0);
--begin  
--process(Inp, s)
--begin
--    s(0) <= Inp(0) NOR Inp(1);
--    if (size > 2) then
--       for i in 1 to size-2 loop
--                s(i) <= s(i-1) NOR Inp(i+1);
--       end loop;
--    end if;
--    res <= s(size-2);
--end process;        
--end NorEle;
