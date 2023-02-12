PROGRAM strahl_pas;
USES crt;
VAR x,y,x1,y1,r1,r2,spd,over,i:WORD;
    c:CHAR;

BEGIN
 ASM
  MOV AX, 0013h
  INT 10h
 END;
 x   := 270; y    := 100;
 x1  := 50;  y1   := 100;
 r1  := 4;   r2   := 6;
 spd := 30; over := 0;

 FOR i := 0 TO 199 DO
  BEGIN
   MEM [$A000: i*320] := 15;
   MEM [$A000: i*320+319] := 15;
  END;

 FOR i := 0 TO 319 DO
  BEGIN
   MEM [$A000 :i] := 15;
   MEM [$A000 :320*199+i] := 15;
  END;

 i := 0;
 RANDOMIZE;

 REPEAT
  REPEAT
   INC(i);
   CASE r1 OF
      4 : DEC(x);
      6 : INC(x);
      8 : DEC(y);
      2 : INC(y);
   END;
   CASE r2 OF
      4 : DEC(x1);
      6 : INC(x1);
      8 : DEC(y1);
      2 : INC(y1);
   END;
   IF MEM [$A000 : y*320+x] <> 0 THEN over := 2;
   IF MEM [$A000 : y1*320+x1] <> 0 THEN over := 1;
   MEM [$A000 : y*320+x] := 15;
   MEM [$A000 : y1*320+x1] := 50;
   IF i = 99 THEN
    BEGIN
     IF spd > 5 THEN DEC(spd);
     IF (PARAMSTR(1) <> 'off') THEN
      BEGIN
       MEM [$A000 : RANDOM(190)*320+1+RANDOM(310)] := 88;
      END;
      i := 0;
    END;
   DELAY(spd);
  UNTIL KEYPRESSED OR (over <> 0);
  IF over = 0 THEN c := READKEY;
  CASE c OF
   '4' : r1 := 4;
   '6' : r1 := 6;
   '8' : r1 := 8;
   '2' : r1 := 2;
   'a' : r2 := 4;
   'd' : r2 := 6;
   'w' : r2 := 8;
   's' : r2 := 2;
  END;
 UNTIL (c = 'q') OR (over <> 0);
 ASM
  MOV AX, 0003h
  INT 10h
 END;
 IF over <> 0 THEN WRITELN('Game Over. Player ',over,' has lost.');
END.


