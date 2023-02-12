PROGRAM GrafikDemoNr1;
USES Graph3;

PROCEDURE EndProg;
  BEGIN
    ASM
     INT 20h
    END;
  END;

PROCEDURE ScrMode(ScrModeVab:INTEGER);
  BEGIN
    ASM
     MOV AX, ScrModeVab
     INT 10h;
    END;
  END;

BEGIN
 ScrMode(19);
 Circle(80,30,10,1);
END.