----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2018 16:23:22
-- Design Name: 
-- Module Name: Adder4 - Bit4Add
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

entity Adder4 is
    Port ( P,Q : in STD_LOGIC_VECTOR (3 downto 0);
           W : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end Adder4;

architecture Bit4Add of Adder4 is
component half_adder port (a,b : in STD_LOGIC;
                           sum,co : out STD_LOGIC);
end component;
component fullAdd port(A, B, Ci : in STD_LOGIC;
                       S,Co : out STD_LOGIC);
end component;
    signal C: STD_LOGIC_VECTOR(3 downto 1) ;
begin
    HA : half_adder port map (P(0), Q(0), W(0),C(1));   
    FA1 : fullAdd port map (P(1), Q(1),C(1), W(1), C(2));
    FA2 : fullAdd port map (P(2), Q(2),C(2), W(2), C(3));
    FA3 : fullAdd port map (P(3), Q(3),C(3), W(3), Cout);
end Bit4Add;
