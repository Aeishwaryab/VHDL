----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.03.2018 12:11:12
-- Design Name: 
-- Module Name: Mux - Sel
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
use work.baseLogic.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Mux is
    Port ( In0, In1, In2, In3, So, S1 : in STD_LOGIC;
           Op : out STD_LOGIC);
end Mux;

architecture Sel of Mux is
signal SoNot, S1Not: STD_LOGIC;
signal Inp1,Inp2,Inp3, Inp4: STD_LOGIC_VECTOR(2 downto 0);
signal Op1 : STD_LOGIC_VECTOR(3 downto 0);
begin
SoNot <= NOT So;
S1Not <= NOT S1;
Inp1 <= In0 & SoNot & S1Not;
C1: GenAnd generic map(3) port map (Inp=>Inp1, res=>Op1(0));
Inp2 <= In1 & So & S1Not ;
C2: GenAnd generic map(3) port map (Inp2, Op1(1));
Inp3 <= In2 & SoNot & S1;
C3: GenAnd generic map(3) port map (Inp3, Op1(2));
Inp4 <= In3 & So & S1;
C4: GenAnd generic map(3) port map (Inp4, Op1(3));
Op <= Op1(0)OR Op1(1)OR Op1(2)OR Op1(3);
end Sel;
