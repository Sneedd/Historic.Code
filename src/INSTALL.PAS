{***********************************************************
 ***                                                     ***
 ***      INSTALL v1.0   TP 6.01  SO '97                 ***
 ***                                                     ***
 ***********************************************************}

PROGRAM Install_v10;
USES crt;
LABEL 10,20,30,40,50;
VAR Path0: String;
    Eingabe: Char;

PROCEDURE MainScreen;
BEGIN
 TextBAckground(0); ClrScr; TextColor(4); TextBackground(7);
 GotoXY (20,8);  WriteLn (' INSTALL v1.0 ');
 GotoXY (17,9);  WriteLn ('ษอออออออออออออออออออออออออออออออออออออออออออป');
 GotoXY (17,10); WriteLn ('บ                                           บ');
 GotoXY (17,11); WriteLn ('บ                                           บ');
 GotoXY (17,12); WriteLn ('บ                                           บ');
 GotoXY (17,13); WriteLn ('บ                                           บ');
 GotoXY (17,14); WriteLn ('บ                                           บ');
 GotoXY (17,15); WriteLn ('ศอออออออออออออออออออออออออออออออออออออออออออผ');
 GotoXY (19,10); WriteLn ('AMBERSTAR von Thailon');
 GotoXY (19,12); WriteLn ('HDD-Speicherplatz: 5000 KBytes');
END;

PROCEDURE ChangeIO(h:real);
BEGIN
  TextColor(4); TextBackground(7);
  GotoXY (19,14); WriteLn ('  INSTALL     VERZEICHNIS      BEENDEN ');
  TextColor(7); TextBackground(4);
  If h = 0 Then GotoXY (20,14); Write (' INSTALL ');
  If h = 1 Then GotoXY (24,14); Write (' VERZEICHNIS ');
  If h = 2 Then GotoXY (30,14); Write (' BEENDEN ');
  TextColor(4); TextBackground(7);
END;

BEGIN
  Path0 := 'C:\GAMES\AMBER';
  MainScreen;
  ChangeIO(0);
  GotoXY (19,11); WriteLn (Path0);

  ReadLn;
END.


