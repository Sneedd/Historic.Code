{$X+}
{****************************************************************************
 ****                                                                    ****
 ****  GRAPHICS.PAS ist eine UNIT-DATEI, die 2D-Grafikelemente anzeigt.  ****
 ****  Teilweise auch in Assembler geschrieben. Sollten sie 3D-Grafiken  ****
 ****  verwenden ich habe auch eine UNITDatei geschrieben fr diese Art  ****
 ****  von Grafiken, sie heiát 3DGRAPH.PAS. Im Textmodus w„re die Datei  ****
 ****  DOSTEXT.PAS vielleicht interresant.                               ****
 ****                                                                    ****
 ****************************************************************************
 ****                                                                    ****
 ****       COPYRIGHT 1997  Steffen Ott                                  ****
 ****                       Marderweg 8                                  ****
 ****                       78532 Tuttlingen                             ****
 ****                       Germany                                      ****
 ****                                                                    ****
 ****************************************************************************}

PROGRAM GraphicsPAS;
USES crt,graph;
VAR g:WORD;

PROCEDURE Screen(mode:INTEGER);
   BEGIN
     ASM
      MOV AX, [mode]
      INT 10h
     END;
     WRITE;
   END;
PROCEDURE PSet(SetPixX,SetPixY:WORD;SetPixC:BYTE);
   BEGIN
     ASM
      MOV AH, 12
      MOV DX, [SetPixY]
      MOV CX, [SetPixX]
      MOV AL, [SetPixC]
      INT 10h
     END;
   END;
PROCEDURE PSetM(SetPixX,SetPixY:WORD;SetPixC:BYTE); {Geht nur bei VGA(13)}
  BEGIN
  MEM [$A000:SetPixX+(SetPixY*320)]:=SetPixC;
  END;
FUNCTION PGet(GetPixX,GetPixY:WORD):BYTE;
   VAR op:BYTE;
   BEGIN
     ASM
      MOV AH,13
      MOV DX, [GetPixY]
      MOV CX, [GetPixX]
      INT 10h
      MOV [op], AL
     END;
    PGet := op;
   END;
FUNCTION ScreenR:BYTE;
   VAR modus:BYTE;
   BEGIN
     ASM
      MOV AH, 15
      INT 10h
      MOV [modus], AL
     END;
   ScreenR := modus;
   END;
PROCEDURE Box(BoxX1,BoxY1,BoxX2,BoxY2:WORD;BoxC:BYTE);
   VAR vx,vy:BYTE;
   BEGIN
     FOR vx := BoxX1 TO BoxX2 DO PSET (vx,BoxY1,BoxC);
     FOR vy := BoxY1 TO BoxY2 DO PSET (vx,vy,BoxC);
     FOR vx := BoxX2 DOWNTO BoxX1 DO PSET (vx,BoxY2,BoxC);
     FOR vy := BoxY2 DOWNTO BoxY1 DO PSET (BoxX1,vy,BoxC);
   END;
PROCEDURE BoxFill(BoxX1,BoxY1,BoxX2,BoxY2:WORD;BoxC:BYTE);
   VAR vx,vy:BYTE;
   BEGIN
     FOR vy := BoxY1 TO BoxY2 DO
      BEGIN
        FOR vx := BoxX1 TO BoxX2 DO PSET (vx,vy,BoxC);
      END;
   END;
FUNCTION sgn(a:REAL):INTEGER;
     BEGIN
          IF a>0 THEN sgn:=+1;
          IF a<0 THEN sgn:=-1;
          IF a=0 THEN sgn:=0;
     END;
PROCEDURE Line (a, b, c, d, col:INTEGER);
  VAR u,s,v,d1x,d1y,d2x,d2y,m,n:REAL;
  i:INTEGER;
  BEGIN
     u:= c - a; v:= d - b;
     d1x:= SGN(u); d1y:= SGN(v);
     d2x:= SGN(u); d2y:= 0;
     m:= ABS(u); n := ABS(v);
     IF NOT (M>N) THEN
     BEGIN
       d2x := 0;
       d2y := SGN(v);
       m := ABS(v);
       n := ABS(u);
     END;
     s := INT(m / 2);
     FOR i := 0 TO ROUND(m) DO
     BEGIN
          PSET(a,b,col);
          s := s + n;
          IF not (s<m) THEN
          BEGIN
            s := s - m;
            a := a + ROUND(d1x);
            b := b + ROUND(d1y);
          END
          ELSE
          BEGIN
            a := a + ROUND(d2x);
            b := b + ROUND(d2y);
          END;
     END;
END;
PROCEDURE clsw;
 BEGIN
  FILLCHAR (MEM [$A000:0],64000,255);
 END;
PROCEDURE cls;
 BEGIN
  FILLCHAR (MEM [$A000:0],64000,0);
 END;


BEGIN
SCREEN(13);
LINE (10,19,320,200,15);
READKEY;
END.









