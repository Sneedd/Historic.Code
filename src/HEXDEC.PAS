PROGRAM ZahlenKalkulator;
LABEL dectohex,hextodec;
VAR eingabe: STRING;
    endung: CHAR;

PROCEDURE nfo;
 BEGIN
  WRITELN ('Zahlensystem-Wandler V1.0  (c)1997  Steffen Ott  Germany  FREEWARE             ');
  WRITELN ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  WRITELN ('Syntax: ZW <Zahl> [ENTER]                        ');
  WRITELN ('<Zahl> = Eine Hex- oder Dezimalzahl wobei        ');
  WRITELN ('         10d in eine Hexzahl umgewandelt wird und');
  WRITELN ('         10h in eine Dezimalzahl umgewandelt wird');
  HALT(0);
 END;

PROCEDURE ending;
 BEGIN
  WRITELN;
  HALT(0);
 END;

BEGIN
 WRITELN;
 IF PARAMCOUNT > 1 THEN NFO;
 ELSE
  BEGIN
   IF PARAMCOUNT < 1 THEN NFO;
   ELSE eingabe := PARAMSTR(1);
  END;
 endung := COPY(eingabe, LENGHT(eingabe), 1)
 CASE endung OF
  'h': GOTO hextodec
  'd': GOTO dectohex
  ELSE: NFO;
hextodec:

 ENDING;
dectohex:
 ENDING;
END.


procedure WriteHexWord(w: Word);
const
  hexChars: array [0..$F] of Char =
    '0123456789ABCDEF';
begin
  Write(hexChars[Hi(w) shr 4],
        hexChars[Hi(w) and $F],
        hexChars[Lo(w) shr 4],
        hexChars[Lo(w) and $F]);
end;
