PROGRAM Asmodai_Graphic_Demo;
USES crt,Palette;
VAR x:BYTE;

PROCEDURE PSet(SetPixX,SetPixY:WORD;SetPixC:BYTE); {Geht nur bei VGA(13)}
  BEGIN
  MEM [$A000:SetPixX+(SetPixY*320)]:=SetPixC;
  END;

PROCEDURE Scrollup;
 VAR su :BYTE;
 BEGIN
  FOR su := 0 TO 25 DO
   BEGIN
    DELAY(50);
    ASM
     MOV AH, 06h
     MOV AL, 01h
     MOV CH, 00h
     MOV CL, 00h
     MOV DH, 25h
     MOV DL, 80h

     INT 10h
    END;
   WRITE;
   END;
 END;
PROCEDURE InitVGA;
 BEGIN
  ASM
   MOV AX,0013h
   INT 10h
  END;
 END;

BEGIN
InitVGA;
AsmoVoxPal;
FOR x := 0 TO 255 DO PSET(x+10,100,x);
REPEAT UNTIL KEYPRESSED;
END.

