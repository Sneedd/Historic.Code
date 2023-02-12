(********************************
 ** LR International Verwalter **
 ** Version Alpha 1.0 in Turbo **
 ** Pascal 6.0 von Steffen Ott **
 ********************************)
PROGRAM LRInternational_Verwalter;
USES DOS,CRT,LRUNIT;

PROCEDURE EndProg;
BEGIN
 HALT;
END;

PROCEDURE NewUser;
BEGIN
 HALT;
END;

PROCEDURE DeleteUser(who:BYTE);
BEGIN

END;

PROCEDURE StartUp(verzeichnis,lizenz:STRING;COL:COLPAL;Buttons,user:BYTE);
VAR  f                :TEXT;
     h                :INTEGER;
     my,
     mb,
     oq,
     x                :BYTE;
     MouseDetect      :BOOLEAN;
     anwender         :ANWEND;
     op,
     palcol1,
     palcol2,
     palcol3,
     palcol4,
     palcol5          :STRING;

BEGIN
 TEXTCOLOR(7);
 TEXTBACKGROUND(0);
 CLRSCR;
 TEXTBAR(4,7,'LR Operationsystem Version 1.0'); Color(7,0);
 WRITELN;
 WRITE('Suche nach Maus: ');
 MouseDetect := RDRS(Buttons);
 IF NOT MouseDetect THEN
 BEGIN
  WRITELN('Keine Vorhanden!');
  HALT(1);
 END;
 WRITELN('Gefunden');
 DELAY(150);
 WRITE('Suche Konfigurationsdatei: ');
 IF NOT FILEEXISTS('LR.CFG') THEN
 BEGIN
  WRITELN('LR.CFG nicht gefunden.');
  WRITELN('Starte SETUP.EXE');
  HALT(0);
 END
 ELSE WRITELN('OK');
 ASSIGN (f,'LR.CFG');
 RESET  (f);
 READLN (f,lizenz);
 READLN (f,palcol1);
 READLN (f,palcol2);
 READLN (f,palcol3);
 READLN (f,palcol4);
 READLN (f,palcol5);
 READLN (f,verzeichnis);
 CLOSE  (f);
 DELETE(palcol1,0,17);
 DELETE(palcol2,0,17);
 DELETE(palcol3,0,17);
 DELETE(palcol4,0,17);
 DELETE(palcol5,0,17);
 DELETE(verzeichnis,0,17);
 DELETE(lizenz,0,17);
 VAL(palcol1,col[1],h);
 VAL(palcol2,col[2],h);
 VAL(palcol3,col[3],h);
 VAL(palcol4,col[4],h);
 VAL(palcol5,col[5],h);
 DELAY(500);
 WRITE('Suche Anwenderdatei: ');
 IF NOT FILEEXISTS(verzeichnis+'DATA\LRANWEND.INI') THEN
 BEGIN
  WRITELN('Keine Anwenderdatei gefunden. Erstelle eine neue.');
  DELAY(500);
  ASSIGN(f,verzeichnis+'DATA\LRANWEND.INI');
  REWRITE(f);
  FOR x := 1 TO 5 DO
  BEGIN
   STR(x,op);
   WRITELN(f,'ANWENDER'+op+' = -----------------------------------------');
   CLOSE(f);
  END;
 END
 ELSE
 BEGIN
  WRITELN('OK');
  ASSIGN(f,verzeichnis+'DATA\LRANWEND.INI');
  RESET(f);
  READLN(f,anwender[1]);
  READLN(f,anwender[2]);
  READLN(f,anwender[3]);
  READLN(f,anwender[4]);
  READLN(f,anwender[5]);
  CLOSE(f);
 END;
 FOR x := 1 TO 5 DO DELETE(anwender[x],0,13);
 DELAY(1000);
 Filler($07,'±');
 TEXTBAR(Col[1],Col[2],'LR International Kundenverwalter');
 TEXTBOX(Col[1],Col[2],70,16);
 PButton(10, 6,60,COL,'1: '+anwender[1],0);
 PButton(10, 8,60,COL,'2: '+anwender[2],0);
 PButton(10,10,60,COL,'3: '+anwender[3],0);
 PButton(10,12,60,COL,'4: '+anwender[4],0);
 PButton(10,14,60,COL,'5: '+anwender[5],0);
 PButton(10,19,60,COL,'RšCKKEHR ZUM BETRIEBSYSTEM',0);
 SHOWMOUSECURSOR;
 REPEAT
  GOTOXY(1,1);
  mb := GETMOUSEBUTTON;
  my := (GETMOUSEY DIV 8)+1;
  CASE mb OF
   1 : BEGIN
        IF my = 19 THEN EndProg;
        my := ((my-6) DIV 2)+1;
        IF anwender[my] <> '-----------------------------------------' THEN
        BEGIN user := my; EXIT; END
        ELSE NewUser;
       END;
   2 : DeleteUser(my);
  END;
 UNTIL KEYPRESSED;


END;



VAR path, lizenz :STRING;
    COL          :COLPAL;
    Buttons, user:BYTE;

BEGIN
StartUp(path,lizenz,COL,Buttons,user);
END.