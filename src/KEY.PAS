PROGRAM KeyboardAbfrage;
USES Crt;
VAR Out:Char;
    Ch:Byte;

PROCEDURE KeyIN(KeyCode:Char;NulSchalter:Byte);
BEGIN
  KeyCode := ReadKey;
  IF KeyCode = #0 THEN
    BEGIN
     KeyCode := ReadKey;
     Nulschalter := 1;
  END
  ELSE
    NulSchalter := 2;
END;


BEGIN
CLRSCR;
KeyIN(Out,Ch);
{WRITELN (Out);}
READLN;
END.