PROGRAM Write_WriteLn_Demo;       
VAR num:BYTE;                    
BEGIN                            
  num := 19;                     
  WRITE ('Die Zahl ist ',num);
  WRITELN;                       
  WRITELN ('Die Zahl ist ',num); 
  WRITELN;                       
  WRITE ('Die Zahl ist ');       
  WRITE (num);                   
  WRITELN;                       
  WRITELN ('Die Zahl ist ');     
  WRITELN (num);
END.
