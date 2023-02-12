UNIT DosWindows;

INTERFACE
PROCEDURE InitVGA;   {In den 640x480x16 Modus wechseln}
PROCEDURE CloseVGA;  {ZurÅck in den Textmodus wechseln}

IMPLEMENTATION
PROCEDURE InitVGA; {****************************************************}
 BEGIN
  ASM
   MOV AX, 0012h
   INT 10h
  END;
  WRITE;
 END;
PROCEDURE CloseVGA;  {**************************************************}
 BEGIN
  ASM
   MOV AX, 0003h
   INT 10h
  END;
  WRITE;
 END;

BEGIN
END.
