PROGRAM CD_Archiv;
USES GMenu,crt;

var x:BYTE;
BEGIN
{SET640x480x16;}
ASM
 MOV AX, 0013h
 INT 10h
END;
setpalette16;
write;
for x := 0 to 15 do pset(x+10,10,x);
repeat until keypressed;



END.