----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2018 21:02:59
-- Design Name: 
-- Module Name: RegisterSerial - Behavioral
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

entity RegisterSerial is
    generic(size: integer:=4);
    Port ( Dr,Dl : inout STD_LOGIC;
           Q: inout STD_LOGIC_VECTOR (size-1 downto 0):=(others=>'0'); -- Dr-> SR input Dl-> SL input Q-> parallel Output vector
           Dp: in STD_LOGIC_VECTOR (size-1 downto 0):=(others=>'0');  -- parallel input
           CLK : in STD_LOGIC;        -- clock 
           Clr,Rst,SR : in STD_LOGIC; -- Clr-> clear signal; Rst-> reset to all 1s; SR=1-> shift right SR=0-> Shift left
           PSn: in STD_LOGIC_VECTOR(1 downto 0):="00"); -- Parallel input high Serial output low Eg. PSn=00->SISO; PSn=01->PISO; PSn=10->SIPO; PSn=11->PIPO; 
end RegisterSerial;

architecture GenericReg of RegisterSerial is
signal Dtemp:STD_LOGIC_VECTOR (size-1 downto 0):=(others=>'0'); -- required only for PISO operation
signal n: integer:=0;                    -- required only for PISO operation
begin
process(CLK, Rst, Clr)
begin
    if(Clr = '0') then
        Q <= (others=>'0');    -- Clear sets all parallel outputs to 0
        Dl<= '0';              
    elsif(Rst = '0') then
        Q <= (others=>'1');      -- Reset sets all parallel outputs to 1
        Dl <= '1';         
    elsif(CLK'event and CLK = '1' ) then   -- at rising Clock Edge
     ----------SERIAL Input----------------------
        if(PSn(0) = '0') then                 -- Serial output operation 
      ----------ADD CONDITION FOR PARALLEL Output-----------
            if (PSn(1)= '1') then
                Dtemp(0)<= Dr;                     -- Input from Right input
              --  Dl<=Q(size-1);                 -- output at Dl (left input)
                for i in 1 to size-1 loop
                    Dtemp(i)<=Dtemp(i-1);
                 end loop;
                 n<=n+1;
                 if (n=4) then
                    Q<=Dtemp;
                    n<=0;
                 end if;
      ---------SERIAL Output--------------------                                      
            else
                if (SR = '1') then                -- Shift right active
                    Q(0)<= Dr;                     -- Input from Right input
                    Dl<=Q(size-1);                 -- output at Dl (left input)
                    for i in 1 to size-1 loop
                        Q(i)<=Q(i-1);
                    end loop;
                else                              -- Shift right low i.e. Shift left operation
                    Q(3)<=Dl;                      -- Take input from left input
                    Dr<=Q(0);                      -- output at Dr (right input)
                    for i in 1 to size-1 loop
                        Q(size-1-i)<=Q(size-i);
                    end loop;
                end if;
            end if;
     --------- Parallel Input--------------------
        elsif (PSn(0) = '1')then
            Dtemp<= Dp;
     ------ Parallel Output ---------------------
            if(PSn(1)='1') then
                 Q <= Dp;
     ------- Serial Output-----------------------
             else
                  if (SR = '1') then  -- Shift Right active
                  -------------ERROR IN PISO-----------
                         Dr<=Dtemp(n);        
                         Q(0)<= Dr;
                         Dl<=Q(size-1); 
                         for i in 1 to size-1 loop
                             Q(i)<=Q(i-1);
                         end loop;
                         n <= n+1; 
                         if (n=size) then
                              n<=0;
                         end if;
                  else                -- Shift right inactive
                         Dl<=Dtemp(n);
                         Q(3)<=Dl;
                         Dr<=Q(0);
                         for i in 1 to size-1 loop
                             Q(size-1-i)<=Q(size-i);
                         end loop;
                         n <= n+1; 
                         if (n=size) then
                               n<=0;
                          end if;
                  end if;
         end if;       
     end if;   
    end if;
end process;
end GenericReg;