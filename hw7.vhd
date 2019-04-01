Library IEEE;
Use IEEE.std_logic_1164.All;
Entity smoother is
  port( c_in : in std_logic;
        c_out, c_out1 : out integer range 0 to 3);
  end Entity;
Architecture Smoother_arch of Smoother is
  type array_signal is array (0 to 8) of integer; -- to create a type for array
  signal b : array_signal; -- to create an 9 bit array
  function max (signal  b : in array_signal)
    return integer is
    variable max: integer := 0;
    variable i: integer := 0;
    begin
     for i in 0 to 7 loop
          if (b(i) < b(i+1)) then
            max := i+1;
          end if;
        end loop;
        return max;
     end max;
  procedure counter (signal arr : inout array_signal;
                        signal a : in std_logic) is
        begin
          if (a = '0') then
            arr(0) <=arr(0)+1;
          elsif ( a = '1') then
            arr(1) <=arr(1)+1;
          elsif ( a = 'U') then
            arr(2) <=arr(2)+1;
          elsif ( a = '1') then
            arr(3) <=arr(3)+1;
          elsif ( a = '1') then
            arr(4) <=arr(4)+1;
          elsif ( a = '1') then
            arr(5) <=arr(5)+1;
          elsif ( a = '1') then
            arr(6) <=arr(6)+1;
          elsif ( a = '1') then
            arr(7) <=arr(7)+1;
          elsif ( a = '1') then
            arr(8) <=arr(8)+1;
          end if;
        end counter;
  signal a : array_signal;
  signal s : integer :=8;
  begin
    Char_check: process
                  begin
                    counter(a, c_in);
                    s<=max(a);
                  wait on c_in for 100ns;
                  end process Char_check;
  end Smoother_arch;
