PROGRAM Textmode40;
USES crt;
BEGIN
  ASM
     MOV        AX,0003h
     INT        10h
  END;
  Textmode(C40);
END.
