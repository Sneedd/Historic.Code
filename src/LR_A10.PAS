{****************************************************************************
 ****                                                                    ****
 ****    LR International DOS-Programm                                   ****
 ****                                                                    ****
 ****************************************************************************
 ****                                                                    ****
 ****  Programmiert in Turbo Pascal 6.0                                  ****
 ****               von Steffen Ott                                      ****
 ****               Marderweg 8                                          ****
 ****               78532 Tuttlingen                                     ****
 ****                                                                    ****
 ****************************************************************************}

PROGRAM LR_Prog_Alpha_10;
USES crt, basic;

PROCEDURE ScrMenu;
   BEGIN
     GOTOXY(40,10); WRITE ('DRšCKEN SIE DIE');
     GOTOXY(40,11); WRITE ('FUNKTIONSTASTE');
     GOTOXY(40,12); WRITE ('F1 UM HILFE ZU');
     GOTOXY(40,13); WRITE ('BEKOMMEN. SIE');

     GOTOXY(22,10); WRITE (' KUNDENKARTEI ');
     GOTOXY(22,11); WRITE (' PRODUKTPALETTE ');
     GOTOXY(22,15); WRITE (' KONFIGURATION ');
     GOTOXY(22,16); WRITE (' BEENDEN ');
   END;

BEGIN
 CLRSCR;
 TEXTBOX(4,7,40,9);
 ScrMenu;

 READLN;
END.



