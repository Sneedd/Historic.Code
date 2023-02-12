UNIT setuptpu;

INTERFACE
USES crt;
PROCEDURE Closing;
PROCEDURE TBlue;
PROCEDURE TGray;
PROCEDURE TextBox(TxtCol,TxtBkg,BoxX,BoxY:BYTE);
PROCEDURE TextBar(TxtCol, TxtBackground:BYTE; TextPrint:STRING);
PROCEDURE PaintText(Temp1C:CHAR);
PROCEDURE BlueScreen(f:CHAR;menu:STRING);
PROCEDURE Hinweise;
FUNCTION FileExists(FileName: STRING): BOOLEAN;
PROCEDURE MenuItems1(hj:SHORTINT);
PROCEDURE MenuItems2(hj:SHORTINT);
PROCEDURE MenuItems3(hj:SHORTINT);
PROCEDURE MenuItems4(hj:SHORTINT);
PROCEDURE MenuItems5(hj:SHORTINT);
PROCEDURE MenuItems6(hj:SHORTINT);

IMPLEMENTATION
PROCEDURE MenuItems1(hj:SHORTINT);
 BEGIN
  TGRAY;
  GOTOXY(8,8);  WRITE(' BILDSCHIRMMODUS           ');
  GOTOXY(8,9);  WRITE(' MUSIKTREIBER              ');
  GOTOXY(8,10); WRITE(' EINGABEGERTE             ');
  GOTOXY(8,12); WRITE(' SPEICHERN UND BEENDEN     ');
  GOTOXY(8,13); WRITE(' BEENDEN OHNE ZUSPEICHERN  ');
  TBLUE;
  CASE hj OF
   0 : BEGIN GOTOXY(8,8);  WRITE(' BILDSCHIRMMODUS           ');  END;
   1 : BEGIN GOTOXY(8,9);  WRITE(' MUSIKTREIBER              ');  END;
   2 : BEGIN GOTOXY(8,10); WRITE(' EINGABEGERTE             ');  END;
   3 : BEGIN GOTOXY(8,12); WRITE(' SPEICHERN UND BEENDEN     ');  END;
   4 : BEGIN GOTOXY(8,13); WRITE(' BEENDEN OHNE ZUSPEICHERN  ');  END;
  END;
 END;
PROCEDURE MenuItems2(hj:SHORTINT);
 BEGIN
  TGRAY;
  GOTOXY(8,8);  WRITE(' 320x200x256  VGA          ');
  GOTOXY(8,9);  WRITE(' 640x400x256  SVGA         ');
  GOTOXY(8,11); WRITE(' EIN BILDSCHIRM ZURCK     ');
  GOTOXY(8,12); WRITE(' BEENDEN OHNE ZUSPEICHERN  ');
  TBLUE;
  CASE hj OF
   0 : BEGIN GOTOXY(8,8);  WRITE(' 320x200x256  VGA          ');  END;
   1 : BEGIN GOTOXY(8,9);  WRITE(' 640x400x256  SVGA         ');  END;
   2 : BEGIN GOTOXY(8,11); WRITE(' EIN BILDSCHIRM ZURCK     ');  END;
   3 : BEGIN GOTOXY(8,12); WRITE(' BEENDEN OHNE ZUSPEICHERN  ');  END;
  END;
 END;
PROCEDURE MenuItems3(hj:SHORTINT);
 BEGIN
  TGRAY;
  GOTOXY(8,8);  WRITE(' ACUMOS                 ');
  GOTOXY(8,9);  WRITE(' AHEADA   AHEADB        ');
  GOTOXY(8,10); WRITE(' ATI OLD  ATI NEW       ');
  GOTOXY(8,11); WRITE(' CHIPS AND TECHNOLOGIES ');
  GOTOXY(8,12); WRITE(' VESA                   ');
  GOTOXY(8,13); WRITE(' TSENG 4000             ');
  GOTOXY(8,14); WRITE(' PARADISE               ');
  GOTOXY(8,15); WRITE(' EVEREX                 ');
  GOTOXY(8,16); WRITE(' REALTEK                ');
  GOTOXY(8,17); WRITE(' TRIDENT 8800 / 8900    ');
  TBLUE;
  CASE hj OF
   0 : BEGIN GOTOXY(8,8);  WRITE(' ACUMOS                 '); END;
   1 : BEGIN GOTOXY(8,9);  WRITE(' AHEADA   AHEADB        '); END;
   2 : BEGIN GOTOXY(8,10); WRITE(' ATI OLD  ATI NEW       '); END;
   3 : BEGIN GOTOXY(8,11); WRITE(' CHIPS AND TECHNOLOGIES '); END;
   4 : BEGIN GOTOXY(8,12); WRITE(' VESA                   '); END;
   5 : BEGIN GOTOXY(8,13); WRITE(' TSENG 4000             '); END;
   6 : BEGIN GOTOXY(8,14); WRITE(' PARADISE               '); END;
   7 : BEGIN GOTOXY(8,15); WRITE(' EVEREX                 '); END;
   8 : BEGIN GOTOXY(8,16); WRITE(' REALTEK                '); END;
   9 : BEGIN GOTOXY(8,17); WRITE(' TRIDENT 8800 / 8900    '); END;
  END;
 END;
PROCEDURE MenuItems4(hj:SHORTINT);
 BEGIN
  TGRAY;
  GOTOXY(8,8);  WRITE(' KEIN SOUND                ');
  GOTOXY(8,9);  WRITE(' SOUNDBLASTER              ');
  GOTOXY(8,11); WRITE(' EIN BILDSCHIRM ZURCK     ');
  GOTOXY(8,12); WRITE(' BEENDEN OHNE ZUSPEICHERN  ');
  TBLUE;
  CASE hj OF
   0 : BEGIN GOTOXY(8,8);  WRITE(' KEIN SOUND                ');  END;
   1 : BEGIN GOTOXY(8,9);  WRITE(' SOUNDBLASTER              ');  END;
   2 : BEGIN GOTOXY(8,11); WRITE(' EIN BILDSCHIRM ZURCK     ');  END;
   3 : BEGIN GOTOXY(8,12); WRITE(' BEENDEN OHNE ZUSPEICHERN  ');  END;
  END;
 END;
PROCEDURE MenuItems5(hj:SHORTINT);
 BEGIN
  TGRAY;
  GOTOXY(8,8);  WRITE(' SPIELER 1                 ');
  GOTOXY(8,9);  WRITE(' SPIELER 2                 ');
  GOTOXY(8,11); WRITE(' EIN BILDSCHIRM ZURCK     ');
  GOTOXY(8,12); WRITE(' BEENDEN OHNE ZUSPEICHERN  ');
  TBLUE;
  CASE hj OF
   0 : BEGIN GOTOXY(8,8);  WRITE(' SPIELER 1                 ');  END;
   1 : BEGIN GOTOXY(8,9);  WRITE(' SPIELER 2                 ');  END;
   2 : BEGIN GOTOXY(8,11); WRITE(' EIN BILDSCHIRM ZURCK     ');  END;
   3 : BEGIN GOTOXY(8,12); WRITE(' BEENDEN OHNE ZUSPEICHERN  ');  END;
  END;
 END;
PROCEDURE MenuItems6(hj:SHORTINT);
 BEGIN
  TGRAY;
  GOTOXY(8,8);  WRITE(' KEYBOARD 1                ');
  GOTOXY(8,9);  WRITE(' KEYBOARD 2                ');
  GOTOXY(8,10); WRITE(' JOYSTICK                  ');
  TBLUE;
  CASE hj OF
   0 : BEGIN GOTOXY(8,8);  WRITE(' KEYBOARD 1                ');  END;
   1 : BEGIN GOTOXY(8,9);  WRITE(' KEYBOARD 2                ');  END;
   2 : BEGIN GOTOXY(8,10); WRITE(' JOSYSTICK                 ');  END;
  END;
 END;

PROCEDURE TBlue;
 BEGIN
  TEXTCOLOR(1);TEXTBACKGROUND(7);
 END;
PROCEDURE TGray;
 BEGIN
  TEXTCOLOR(7);TEXTBACKGROUND(1);
 END;
PROCEDURE Hinweise;
 BEGIN
  GOTOXY(42,5); WRITE ('Benutze die  Pfeiltasten um den');
  GOTOXY(42,6); WRITE ('den Auswahlbalken nach oben und');
  GOTOXY(42,7); WRITE ('unten zu  verschieben und Enter');
  GOTOXY(42,8); WRITE ('um das Angewhlte Objekt zu be-');
  GOTOXY(42,9); WRITE ('sttigen.  ESC ist  ein Abbruch');
  GOTOXY(42,10);WRITE ('ohne zu Speichern.             ');
  GOTOXY(42,12);WRITE ('     SETUP V1.0 von Steffen Ott');
  GOTOXY(42,13);WRITE ('                 Copyright 1997');
 END;
PROCEDURE TextBox(TxtCol,TxtBkg,BoxX,BoxY:BYTE);
 VAR gf,vx,vy,g,BoxX0,BoxY0:BYTE;
 BEGIN
  TEXTCOLOR(TxtCol);TEXTBACKGROUND(TxtBkg);
  GOTOXY(2,3); WRITE('ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
  FOR gf := 1 TO 18 DO
   BEGIN
    GOTOXY(2,gf+3); WRITE('บ                                                                            บ');
   END;
  GOTOXY(2,22); WRITE('ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
 END;

PROCEDURE TextBar(TxtCol, TxtBackground:BYTE; TextPrint:STRING);
   VAR v:BYTE;
   BEGIN
     TEXTCOLOR(TxtCol); TEXTBACKGROUND(TxtBackground);
     GOTOXY (1,1); FOR v := 0 TO 79 DO WRITE ('Û');
     GOTOXY (40-LENGTH(TextPrint) DIV 2, 1);
     WRITELN (' ', TextPrint, ' ');
   END;

PROCEDURE PaintText(Temp1C:CHAR);
VAR c:WORD;
    Temp1:BYTE;
BEGIN
CLRSCR;
TEXTCOLOR(7);TEXTBACKGROUND(1);
FOR c := 0 TO 1998 DO
  WRITE (Temp1C);
ASM
 MOV AH, 07h
 MOV AL, 01h
 MOV CH, 00h
 MOV CL, 00h
 MOV DH, 25
 MOV DL, 80
 MOV BH, 14
 INT 10h
END;
GOTOXY(1,1);
FOR c := 0 TO 80 DO WRITE (Temp1C);
END;
PROCEDURE BlueScreen(f:CHAR;menu:STRING);
 BEGIN
  PAINTTEXT(f);
  TEXTBOX(15,1,76,18);
  TEXTBAR(1,15,menu);
 END;
FUNCTION FileExists(FileName: STRING): BOOLEAN;
{ Gibt Wahr zurck falls die Datei existiert }
VAR
  f: FILE;
BEGIN
  {$I-}
  ASSIGN(f, FileName);
  RESET(f);
  CLOSE(f);
  {$I+}
  FileExists := (IOResult = 0) and (FileName <> '');
END;
PROCEDURE Closing;
 BEGIN
  TEXTCOLOR(7);
  TEXTBACKGROUND(0);
  CLRSCR;
  WRITELN; WRITELN(' Setup abgebrochen!');Writeln;
  HALT(0);
 END;

BEGIN
END.
