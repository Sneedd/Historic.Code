PROGRAM Beispiel_fuer_Mouseunit;
USES crt,mouseunit;
VAR x,y:WORD;

BEGIN
 InitMouse;
 CLRSCR;
 GOTOXY(1,4); WRITE('DrÅcke eine Taste um Programm zu beenden');
 REPEAT
 GOTOXY(1,1); WRITELN('Button: ',GetMouseButton);
 GOTOXY(1,2); WRITELN('X: ',getmousex,'         ');
 GOTOXY(1,3); WRITELN('Y: ',getmousey,'         ');
 UNTIL KEYPRESSED;

END.
