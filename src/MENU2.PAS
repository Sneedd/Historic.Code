PROGRAM Menu;
USES crt;

PROCEDURE TextBox(TxtCol,TxtBkg,BoxX,BoxY:BYTE);
   VAR vx,vy,g,BoxX0,BoxY0:BYTE;
   BEGIN
      TEXTCOLOR (TxtCol); TEXTBACKGROUND (TxtBkg);
      BoxX0 := (80 - BoxX) DIV 2;
      BoxY0 := (25 - BoxY) DIV 2;
      GOTOXY(BoxX0,BoxY0); WRITE ('É');
      FOR vx := BoxX0 +1 TO BoxX0 + BoxX DO
        BEGIN
          GOTOXY(vx ,BoxY0); WRITE ('Í');
        END;
      GOTOXY(BoxX0 + BoxX + 1, BoxY0); WRITE ('»');
      BoxY0 := BoxY0 + 1;
      FOR vy := BoxY0 TO BoxY0 + BoxY DO
        BEGIN
          GOTOXY(BoxX0,vy); WRITE ('º');
          FOR vx := BoxX0 + 1 TO BoxX0 + BoxX DO
            BEGIN
              GOTOXY(vx, vy);
              WRITE (' ');
            END;
          GOTOXY(BoxX0+BoxX+1,vy); WRITE ('º');
        END;
      BoxY0 := BoxY0 + BoxY;
      GOTOXY(BoxX0,BoxY0); WRITE ('È');
      FOR vx := BoxX0 + 1 TO BoxX0 + BoxX DO
        BEGIN
          GOTOXY(vx,BoxY0); WRITE ('Í');
        END;
      GOTOXY(BoxX0 + BoxX + 1, BoxY0); WRITE ('¼');
   END;

BEGIN
  TEXTCOLOR (0); TEXTBACKGROUND (0);
  ClrScr;
  TextBox(4,7,60,10);
  ReadLN;
END.