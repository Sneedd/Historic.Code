PROGRAM Setup_ArchonPC;
USES Crt,SetupTpu;
LABEL TAMenu10,TAMenu15,TAMenu20,TAMenu25,TAMenu30,TAMenu35,
      TAMenu40,TAMenu45,TAMenu50,TAMenu55,TAMenu60,TAMenu65,
      TAMenu70,TAMenu75,Saving;
VAR iput,iput0:CHAR;
    Opt1,Opt2,Opt3,Opt4,Opt5,Opt6,Opt7:SHORTINT;
    gd,sd,p1,p2:STRING;
    f:Text;

BEGIN
 ASSIGN (f,'SETUP.CFG');
 IF FILEEXISTS('Setup.Cfg') THEN
  BEGIN
   RESET (f);
    READLN(f,gd); DELETE (gd,1,17);
    READLN(f,sd); DELETE (sd,1,17);
    READLN(f,p1); DELETE (p1,1,17);
    READLN(f,p2); DELETE (p2,1,17);
   CLOSE(f);
  END
 ELSE
  BEGIN
   gd := 'VGA';
   sd := 'KEIN';
   p1 := 'KEY1';
   p2 := 'KEY2';
  END;
 Opt1 := 0; Opt2 := 0; Opt3 := 0; Opt4 := 0; Opt5 := 0; Opt6 := 0; Opt7 := 0;
 BLUESCREEN('±','SETUP von ARCHON ???');

TAMenu10:                                       {Hauptmenu}
 TEXTBOX(15,1,76,18);
 TEXTBAR(1,15,'SETUP von ARCHON ???');
 TGRAY;
 HINWEISE;

TAMenu15:
 MENUITEMS1(Opt1);
 REPEAT
  GOTOXY(1,1);
 UNTIL KEYPRESSED;
 iput := READKEY;
 IF iput = #0 THEN
  BEGIN
   iput0 := READKEY;
    CASE iput0 OF
     #72 : BEGIN              {Pfeiltaste nach Oben}
            Opt1 := Opt1 - 1;
            IF Opt1 = -1 THEN Opt1 := 4;
           END;
     #80 : BEGIN              {Pfeiltaste nach Unten}
            Opt1 := Opt1 + 1;
            IF Opt1 = 5 THEN Opt1 := 0;
           END;
    END;
  END;
 CASE iput OF
  #13 : BEGIN        {Enter}
         CASE Opt1 OF
          0 : GOTO TAMenu20;
          1 : GOTO TAMenu40;
          2 : GOTO TAMenu50;
          4 : CLOSING;
          3 : GOTO Saving;
         END;
        END;
  #27 : CLOSING;    {ESC}
 END;
 GOTO TAMenu15;

TAMenu20:                             {Bildschirmmodus ausw„hlen}
 TEXTBOX(15,1,76,18);
 TEXTBAR(1,15,'SETUP VON ARCHON ??? - Bildschirmmodus w„hlen');
 TGRAY;
 HINWEISE;

TAMenu25:
 MENUITEMS2(Opt2);
 REPEAT
  GOTOXY(1,1);
 UNTIL KEYPRESSED;
 iput := READKEY;
 IF iput = #0 THEN
  BEGIN
   iput0 := READKEY;
    CASE iput0 OF
     #72 : BEGIN              {Pfeiltaste nach Oben}
            Opt2 := Opt2 - 1;
            IF Opt2 = -1 THEN Opt2 := 3;
           END;
     #80 : BEGIN              {Pfeiltaste nach Unten}
            Opt2 := Opt2 + 1;
            IF Opt2 = 4 THEN Opt2 := 0;
           END;
    END;
  END;
 CASE iput OF
  #13 : BEGIN        {Enter}
         CASE Opt2 OF
          0 : gd := 'VGA';
          1 : GOTO TAMenu30;
          2 : GOTO TAMenu10;
          3 : CLOSING;
         END;
         GOTO TAMenu10;
        END;
  #27 : CLOSING;    {ESC}
 END;
 GOTO TAMenu25;

TAMenu30:                             {Grafikkarten Chipsatz ausw„hlen}
 TEXTBOX(15,1,76,18);
 TEXTBAR(1,15,'SETUP VON ARCHON ??? - Bildschirmmodus w„hlen');
 TGRAY;
 HINWEISE;

TAMenu35:
 MENUITEMS3(Opt3);
 REPEAT
  GOTOXY(1,1);
 UNTIL KEYPRESSED;
 iput := READKEY;
 IF iput = #0 THEN
  BEGIN
   iput0 := READKEY;
    CASE iput0 OF
     #72 : BEGIN              {Pfeiltaste nach Oben}
            Opt3 := Opt3 - 1;
            IF Opt3 = -1 THEN Opt3 := 9;
           END;
     #80 : BEGIN              {Pfeiltaste nach Unten}
            Opt3 := Opt3 + 1;
            IF Opt3 = 10 THEN Opt3 := 0;
           END;
    END;
  END;
 CASE iput OF
  #13 : BEGIN        {Enter}
         CASE Opt3 OF
          0 : gd := 'SVGA\ACUMOS';
          1 : gd := 'SVGA\AHEAD';
          2 : gd := 'SVGA\ATI';
          3 : gd := 'SVGA\CAT';
          4 : gd := 'SVGA\VESA';
          5 : gd := 'SVGA\TSENG';
          6 : gd := 'SVGA\PARADISE';
          7 : gd := 'SVGA\EVREX';
          8 : gd := 'SVGA\REALTEK';
          9 : gd := 'SVGA\TRIDENT';
         END;
        GOTO TAMenu10;
        END;
  #27 : CLOSING;    {ESC}
 END;
 GOTO TAMenu35;

TAMenu40:                             {SOUNDKARTE AUSWŽHLEN}
 TEXTBOX(15,1,76,18);
 TEXTBAR(1,15,'SETUP VON ARCHON ??? - Soundkarte ausw„hlen');
 TGRAY;
 HINWEISE;

TAMenu45:
 MENUITEMS4(Opt4);
 REPEAT
  GOTOXY(1,1);
 UNTIL KEYPRESSED;
 iput := READKEY;
 IF iput = #0 THEN
  BEGIN
   iput0 := READKEY;
    CASE iput0 OF
     #72 : BEGIN              {Pfeiltaste nach Oben}
            Opt4 := Opt4 - 1;
            IF Opt4 = -1 THEN Opt4 := 3;
           END;
     #80 : BEGIN              {Pfeiltaste nach Unten}
            Opt4 := Opt4 + 1;
            IF Opt4 = 4 THEN Opt4 := 0;
           END;
    END;
  END;
 CASE iput OF
  #13 : BEGIN        {Enter}
         CASE Opt4 OF
          0 : sd := 'KEIN';
          1 : sd := 'SB';
          3 : CLOSING;
         END;
        GOTO TAMenu10;
        END;
  #27 : CLOSING;    {ESC}
 END;
 GOTO TAMenu45;

TAMenu50:                             {Spieler Eingabe Auswahl}
 TEXTBOX(15,1,76,18);
 TEXTBAR(1,15,'SETUP VON ARCHON ??? - Eingabeger„t Auswahl');
 TGRAY;
 HINWEISE;

TAMenu55:
 MENUITEMS5(Opt5);
 REPEAT
  GOTOXY(1,1);
 UNTIL KEYPRESSED;
 iput := READKEY;
 IF iput = #0 THEN
  BEGIN
   iput0 := READKEY;
    CASE iput0 OF
     #72 : BEGIN              {Pfeiltaste nach Oben}
            Opt5 := Opt5 - 1;
            IF Opt5 = -1 THEN Opt5 := 3;
           END;
     #80 : BEGIN              {Pfeiltaste nach Unten}
            Opt5 := Opt5 + 1;
            IF Opt5 = 5 THEN Opt5 := 0;
           END;
    END;
  END;
 CASE iput OF
  #13 : BEGIN        {Enter}
         CASE Opt5 OF
          0 : GOTO TAMenu70;
          1 : GOTO TAMenu60;
          3 : CLOSING;
         END;
        GOTO TAMenu10;
        END;
  #27 : CLOSING;    {ESC}
 END;
 GOTO TAMenu55;
TAMenu60:                          {Spieler1 Eingabe Auswahl}
 TEXTBOX(15,1,76,18);
 TEXTBAR(1,15,'SETUP VON ARCHON ??? - Eingabeger„t Auswahl');
 TGRAY;
 HINWEISE;

TAMenu65:
 MENUITEMS6(Opt6);
 REPEAT
  GOTOXY(1,1);
 UNTIL KEYPRESSED;
 iput := READKEY;
 IF iput = #0 THEN
  BEGIN
   iput0 := READKEY;
    CASE iput0 OF
     #72 : BEGIN              {Pfeiltaste nach Oben}
            Opt6 := Opt6 - 1;
            IF Opt6 = -1 THEN Opt6 := 2;
           END;
     #80 : BEGIN              {Pfeiltaste nach Unten}
            Opt6 := Opt6 + 1;
            IF Opt6 = 3 THEN Opt6 := 0;
           END;
    END;
  END;
 CASE iput OF
  #13 : BEGIN        {Enter}
         CASE Opt6 OF
          0 : p1 := 'Key1';
          1 : p1 := 'Key2';
          2 : p1 := 'Joy';
         END;
        GOTO TAMenu10;
        END;
  #27 : CLOSING;    {ESC}
 END;
 GOTO TAMenu65;

TAMenu70:                          {Spieler2 Eingabe Auswahl}
 TEXTBOX(15,1,76,18);
 TEXTBAR(1,15,'SETUP VON ARCHON ??? - Eingabeger„t Auswahl');
 TGRAY;
 HINWEISE;

TAMenu75:
 MENUITEMS6(Opt7);
 REPEAT
  GOTOXY(1,1);
 UNTIL KEYPRESSED;
 iput := READKEY;
 IF iput = #0 THEN
  BEGIN
   iput0 := READKEY;
    CASE iput0 OF
     #72 : BEGIN              {Pfeiltaste nach Oben}
            Opt7 := Opt7 - 1;
            IF Opt7 = -1 THEN Opt7 := 2;
           END;
     #80 : BEGIN              {Pfeiltaste nach Unten}
            Opt7 := Opt7 + 1;
            IF Opt7 = 3 THEN Opt7 := 0;
           END;
    END;
  END;
 CASE iput OF
  #13 : BEGIN        {Enter}
         CASE Opt7 OF
          0 : p2 := 'Key1';
          1 : p2 := 'Key2';
          2 : p2 := 'Joy';
         END;
        GOTO TAMenu10;
        END;
  #27 : CLOSING;    {ESC}
 END;
 GOTO TAMenu75;
SAVING:
 IF p1 = p2 THEN
  BEGIN
   TEXTBAR(20,7,'Spieler 1 Eingabeger„t darf nicht gleich Spieler 2 Eingabeger„t sein');
   GOTO TAMenu15;
  END;
 ASSIGN (f,'SETUP.CFG');
 IF FILEEXISTS('Setup.Cfg') THEN RESET (f) ELSE REWRITE(f);
 WRITELN(f,'GRAPHICMODE    = ' + gd);
 WRITELN(f,'SOUNDDRIVER    = ' + sd);
 WRITELN(f,'PLAYER 1 INPUT = ' + p1);
 WRITELN(f,'PLAYER 2 INPUT = ' + p2);
 CLOSE(f);
 TEXTCOLOR(7);
 TEXTBACKGROUND(0);
 CLRSCR;
 WRITELN; WRITELN(' Setup gesichert! Gebe START.EXE [ENTER] ein um Spiel zu starten.'); WRITELN;
 HALT(0);

END.