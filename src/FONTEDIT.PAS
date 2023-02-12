PROGRAM FontEditor;
USES Graph, Crt, Dos;
CONST GraphDriver:INTEGER = 9;
      GraphMode:INTEGER   = 2;
      Pal: ARRAY[0..15,0..2] OF INTEGER =
         (( 0, 0, 0), (16,16,16), (32,32,32), (48,48,48),
          (58,58,58), ( 0,17,63), (20,20,63), (63,45, 0),
          ( 0,46,63), ( 0,31,63), (63,63,22), (51, 0, 0),
          (17,63, 0), ( 0,32, 0), ( 0,18, 0), (63,63,63));
      

PROCEDURE DrawButton(X,Y:WORD);
CONST BlackBitmap : ARRAY[0..52,1..2] OF BYTE =
        (( 0, 0),( 1, 0),( 2, 0),( 3, 0),( 4, 0),( 5, 0),( 0, 1),( 1, 1),
         ( 0, 2),( 2, 2),( 0, 3),( 3, 3),( 0, 4),( 4, 4),(56, 0),(57, 0),
         (58, 0),(59, 0),(60, 0),(59, 1),(60, 1),(58, 2),(60, 2),(57, 3),
         (60, 3),(56, 4),(60, 4),( 0,26),( 4,26),( 0,27),( 3,27),( 0,28),
         ( 2,28),( 0,29),( 1,29),( 0,30),( 1,30),( 2,30),( 3,30),( 4,30),
         (56,26),(60,26),(57,27),(60,27),(58,28),(60,28),(59,29),(60,29),
         (56,30),(57,30),(58,30),(59,30),(60,30));
      DarkGreyBitmap : ARRAY[0..20,1..2] OF BYTE =
        (( 2, 1),( 3, 1),( 4, 1),( 1, 2),( 3, 2),( 4, 2),( 1, 3),( 2, 3),
         ( 3, 3),(56, 1),(57, 1),(58, 1),(56, 2),(57, 2),(56, 3),( 1,26),
         ( 2,26),( 3,26),( 1,27),( 2,27),( 1,28));
      GreyBitmap : ARRAY[0..23,1..2] OF BYTE =
        ((59, 2),(58, 3),(59, 3),(57, 4),(58, 4),(59, 4),( 2,29),( 3,29),
         ( 4,29),( 3,28),( 4,28),( 4,27),(57,26),(58,26),(59,26),(56,27),
         (58,27),(59,27),(56,28),(57,28),(59,28),(56,29),(57,29),(58,29));
VAR i,j:BYTE;
BEGIN
FOR i := 0 TO 52 DO PUTPIXEL(BlackBitmap[i,1]+X,BlackBitmap[i,2]+Y,1);
FOR i := 0 TO 20 DO PUTPIXEL(DarkGreyBitmap[i,1]+X,BlackBitmap[i,2]+Y,2);
FOR i := 5 TO 25 DO
BEGIN
 PUTPIXEL (X   ,Y+i ,1);
 PUTPIXEL (X+1 ,Y+i ,2);
 PUTPIXEL (X+2 ,Y+i ,2);
 PUTPIXEL (X+3 ,Y+i ,2);
 PUTPIXEL (X+4 ,Y+i ,1);
 FOR j := 5 TO 55 DO
 BEGIN
  PUTPIXEL (X+j,Y+i,4);
 END;
 PUTPIXEL (X+56,Y+i ,1);
 PUTPIXEL (X+57,Y+i ,3);
 PUTPIXEL (X+58,Y+i ,3);
 PUTPIXEL (X+59,Y+i ,3);
 PUTPIXEL (X+60,Y+i ,1);
END;
FOR i := 5 TO 55 DO
BEGIN
 PUTPIXEL (X   ,Y   ,1);
 PUTPIXEL (X+i ,Y+1 ,2);
 PUTPIXEL (X+i ,Y+2 ,2);
 PUTPIXEL (X+i ,Y+3 ,2);
 PUTPIXEL (X+i ,Y+4 ,1);
{ FOR j := 5 TO 25 DO
 BEGIN
  PUTPIXEL (X+i,Y+j,4);
 END;}
 PUTPIXEL (X+i ,Y+26,1);
 PUTPIXEL (X+i ,Y+27,3);
 PUTPIXEL (X+i ,Y+28,3);
 PUTPIXEL (X+i ,Y+29,3);
 PUTPIXEL (X+i ,Y+30,1);
END;
END;

PROCEDURE Box(BoxX1,BoxY1,BoxX2,BoxY2:WORD;BoxC:BYTE);
   VAR vx,vy:WORD;
   BEGIN
     FOR vx := BoxX1 TO BoxX2 DO PUTPIXEL (vx,BoxY1,BoxC);
     FOR vy := BoxY1 TO BoxY2 DO PUTPIXEL (vx,vy,BoxC);
     FOR vx := BoxX2 DOWNTO BoxX1 DO PUTPIXEL (vx,BoxY2,BoxC);
     FOR vy := BoxY2 DOWNTO BoxY1 DO PUTPIXEL (BoxX1,vy,BoxC);
   END;
PROCEDURE BoxFill(BoxX1,BoxY1,BoxX2,BoxY2:WORD;BoxC:BYTE);
   VAR vx,vy:WORD;
   BEGIN
     FOR vy := BoxY1 TO BoxY2 DO
      BEGIN
        FOR vx := BoxX1 TO BoxX2 DO PUTPIXEL (vx,vy,BoxC);
      END;
   END;
PROCEDURE AsmoCode;
VAR f :TEXT;
    cx,cy,Color:INTEGER;
    kl:CHAR;
BEGIN
 ASSIGN(f,'ASMOCODE.PIC');
 RESET(f);
 FOR cx := 420 TO 540 DO BEGIN
  FOR cy := 260 TO 380 DO BEGIN
   READ(f,kl);
   Color := ORD(kl);
   IF Color = 9 THEN Color := 7;
   IF Color <> 5 THEN PUTPIXEL(cx,cy,Color);
  END;
 END;
 CLOSE(f);
END;

VAR i : INTEGER;
BEGIN
INITGRAPH(GraphDriver,GraphMode,'C:\TP\BGI');
FOR i := 0 TO 15 DO
BEGIN
 PORT[$3C8] := i;
 PORT[$3C9] := Pal[i,0];
 PORT[$3C9] := Pal[i,1];
 PORT[$3C9] := Pal[i,2];
END;
SETBKCOLOR(5);
BOXFILL(10,10,290,50,9);    BOX(10,10,290,50,4);
BOXFILL(560,20,620,170,3);  BOX(560,20,620,170,1);
BOXFILL(560,190,620,370,3); BOX(560,190,620,370,1);
BOX(520,60,540,240,1);
BOX(20,60,100,140,1); BOX(120,60,200,140,1);
BOX(220,60,300,140,1); BOX(320,60,400,140,1);
BOX(420,60,500,140,1); BOX(20,160,100,240,1);
BOX(120,160,200,240,1); BOX(220,160,300,240,1);
BOX(320,160,400,240,1); BOX(420,160,500,240,1);
ASMOCODE;
FOR i := 0 TO 4 DO DRAWBUTTON(560,20+(30*i));
FOR i := 0 TO 5 DO DRAWBUTTON(560,190+(30*i));

REPEAT UNTIL KEYPRESSED;
CLOSEGRAPH;
END.