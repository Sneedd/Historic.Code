UNIT TextUnit;

INTERFACE
PROCEDURE TextBar(TxtCol, TxtBackground:BYTE; TextPrint:STRING);
PROCEDURE GB;
PROCEDURE BG;
PROCEDURE BR;

IMPLEMENTATION
USES crt;
PROCEDURE GB;
 BEGIN
  TEXTCOLOR(7); TEXTBACKGROUND(0);
 END;
PROCEDURE BG;
 BEGIN
  TEXTCOLOR(0); TEXTBACKGROUND(7);
 END;
PROCEDURE BR;
 BEGIN
  TEXTCOLOR(0); TEXTBACKGROUND(4);
 END;
PROCEDURE TextBar(TxtCol, TxtBackground:BYTE; TextPrint:STRING);
   VAR v:BYTE;
   BEGIN
     TEXTCOLOR(TxtCol); TEXTBACKGROUND(TxtBackground);
     GOTOXY (1,1); FOR v := 0 TO 80 DO WRITE ('?');
     GOTOXY (40-LENGTH(TextPrint) DIV 2, 1);
     WRITE (' ', TextPrint, ' ');
   END;


BEGIN
END.