PROGRAM Menu;
USES crt;
LABEL 10;
VAR TxtCol,TxtBkg :BYTE;
    BoxX,BoxY     :REAL;

PROCEDURE TextBox(TxtCol,TxtBkg,BoxX,BoxY:BYTE);
   VAR h,f,g,BoxX0,BoxY0:BYTE;
   BEGIN
      TEXTCOLOR (TxtCol); TEXTBACKGROUND (TxtBkg);
      BoxX0 := (80 - BoxX) DIV 2;
      BoxY0 := (25 - BoxY) DIV 2;                  {WRITE (BoxX0,',',BoxY0);}
      GOTOXY(BoxX0,BoxY0); WRITE ('ษ');
      FOR f := BoxX0 +1 TO BoxX -1 DO
        BEGIN
          GOTOXY(BoxX0 + f,BoxY0);
          WRITE ('อ');
        END;
      GOTOXY(BoxX0 + BoxX, BoxY0); WRITE ('ป');
      FOR h := 0 TO BoxY DO
        BEGIN
          GOTOXY(BoxX0,BoxY0 + h + 1); WRITELN ('บ');
          FOR g := BoxX0 TO BoxX -1 DO
            BEGIN
              GOTOXY(BoxX0 + BoxX - g,BoxY + h - 2);
              WRITE (' ');
            END;
        END;
{     GOTOXY(12,19); WRITELN ('ศออออออออออออออออออออออออออออออออออออออออออออออออออผ');}
   END;

BEGIN
  TEXTCOLOR (0); TEXTBACKGROUND (0);
  ClrScr;
  TextBox(4,7,60,10);
  ReadLN;
END.