{****************************************************************************
 ****                                                                    ****
 ****     Borland C++ 4.5  Editor 1.00 unter DOS                         ****
 ****   von Steffen Ott in Turbo Pascal 6.0 programmiert.                ****
 ****                                                                    ****
 ****************************************************************************}

{$X+}

PROGRAM Borland_CPP_Editor_v1_00;
USES crt;

PROCEDURE MainScreenMenu(w:BYTE);
   BEGIN
     TEXTBACKGROUND(7); TEXTCOLOR(0);
     GOTOXY(1,1); WRITE ('      ile   dit   earch   un   ompile   ebug   ptions   indow              elp ');
     GOTOXY(1,25); WRITE (' F1 Help  F2 Save  F3 Open  Alt-F9 Compile  F9 Make  F10 Menu                  ');
     TEXTCOLOR(4); GOTOXY(1,1); WRITE ('  ð  F');
     GOTOXY(12,1); WRITE ('E'); GOTOXY(18,1); WRITE ('S');
     GOTOXY(26,1); WRITE ('R'); GOTOXY(31,1); WRITE ('C');
     GOTOXY(40,1); WRITE ('D'); GOTOXY(47,1); WRITE ('O');
     GOTOXY(56,1); WRITE ('W'); GOTOXY(75,1); WRITE ('H');
     GOTOXY(2,25); WRITE ('F1');
     GOTOXY(11,25); WRITE ('F2');
     GOTOXY(20,25); WRITE ('F3');
     GOTOXY(29,25); WRITE ('Alt-F9');
     GOTOXY(45,25); WRITE ('F9');
     GOTOXY(54,25); WRITE ('F10');
     IF
   END;

BEGIN
TEXTBACKGROUND(0);
CLRSCR;
MainScreenMenu(1);


READ;
END.