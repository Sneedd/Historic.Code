UNIT GMenu;

INTERFACE
USES Crt;
PROCEDURE Set640x480x16;
PROCEDURE Set800x600x16;
PROCEDURE Set640x400x16;
PROCEDURE SetPalette16;
PROCEDURE Settext;
PROCEDURE PSet(SetPixX,SetPixY:WORD;SetPixC:BYTE);
PROCEDURE Line (a, b, c, d, col:INTEGER);
PROCEDURE Box(BoxX1,BoxY1,BoxX2,BoxY2:WORD;BoxC:BYTE);
PROCEDURE BoxFill(BoxX1,BoxY1,BoxX2,BoxY2:WORD;BoxC:BYTE);
FUNCTION sgn(a:REAL):INTEGER;
PROCEDURE Scrollup;
PROCEDURE StartUp;

IMPLEMENTATION
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
PROCEDURE StartUp;
BEGIN
ScrollUp;
Set640x480x16;
SetPalette16;
END;
PROCEDURE Set800x600x16;
BEGIN
 ASM
  MOV AX, 0029h
  INT 10h
 END;
 write;
END;
PROCEDURE Set640x480x16;
BEGIN
 ASM
  MOV AX, 0012h
  INT 10h
 END;
 write;
END;
PROCEDURE Set640x400x16;
BEGIN
 ASM
  MOV AX, 0014h
  INT 10h
 END;
 write;
END;
PROCEDURE Settext;
BEGIN
 ASM
  MOV AX, 0003h
  INT 10h
 END;
 write;
END;
PROCEDURE SetPal(ColorNo : Byte; R,G,B : Byte);
BEGIN
 PORT[$3c8] := ColorNo;
 PORT[$3c9] := R;
 PORT[$3c9] := G;
 PORT[$3c9] := B;
END;
PROCEDURE SetPalette16;
BEGIN
 SetPal( 0, 0, 0, 0);
 SetPal( 1,20,20,20);
 SetPal( 2,36,36,36);
 SetPal( 3,51,51,51);
 SetPal( 4, 0, 0,41);
 SetPal( 5, 0,17,63);
 SetPal( 6,20,20,63);
 SetPal( 7, 0,31,63);
 SetPal( 8, 0,46,63);
 SetPal( 9,63,45, 0);
 SetPal(10,63,63,22);
 SetPal(11,51, 0, 0);
 SetPal(12,17,63, 0);
 SetPal(13, 0,32, 0);
 SetPal(14, 0,18, 0);
 SetPal(15,63,63,63);
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


BEGIN
END.