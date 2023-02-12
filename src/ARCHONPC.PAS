PROGRAM ArchonPC1;
USES crt,palette;
VAR col:BYTE;
    h:WORD;
PROCEDURE screen(scrmode:byte);
 BEGIN
  ASM
   MOV AH, 00
   MOV AL,[scrmode]
   INT 10h
  END;
 END;
PROCEDURE PSet(SetPixX,SetPixY:WORD;SetPixC:BYTE);
 BEGIN
  MEM [$A000:SetPixX+(SetPixY*320)]:=SetPixC;
 END;

FUNCTION sgn(a:REAL):INTEGER;
     BEGIN
          IF a>0 THEN sgn:=+1;
          IF a<0 THEN sgn:=-1;
          IF a=0 THEN sgn:=0;
     END;
PROCEDURE Lineh (a, b, c, d, col:INTEGER);
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


BEGIN
SCREEN (19);
AsmoDemoPal256;
REPEAT
col := col +1;
if col = 255 THEN h := h + 1;
PSET(col,h,col);
UNTIL KEYPRESSED;
SCREEN (3);
END.




