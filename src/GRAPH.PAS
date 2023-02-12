PROGRAM GrafikModus_HeaderDatei;

PROCEDURE TextModus;
BEGIN
  ASM
     MOV        AX,0003h
     INT        10h
  END;
END;

PROCEDURE GrafikModus_320x200x255;
BEGIN
  ASM
     MOV        AX,0013h
     INT        10h
  END;
END;

PROCEDURE GrafikModus_640x350x16;
BEGIN
  ASM
     MOV        AX,0010h
     INT        10h
  END;
END;

PROCEDURE GrafikModus_640x480x16;
BEGIN
  ASM
     MOV        AX,0012h
     INT        10h
  END;
END;

BEGIN
GrafikModus_640x480x16;
GrafikModus_320x200x255;
TextModus;
END.


