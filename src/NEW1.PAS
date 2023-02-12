PROGRAM new1;
USES crt;
VAR iput,iput0:CHAR;

PROCEDURE wait;
BEGIN
REPEAT UNTIL KEYPRESSED;
END;

FUNCTION keyread:WORD;
VAR iput, iput0:CHAR;
BEGIN
  iput := READKEY;
  IF iput = #0 THEN BEGIN
     iput0 := READKEY;
     keyread := 1000 + ORD(iput0);
     EXIT;
  END;
  keyread := ORD(iput);
END;

BEGIN
CLRSCR;
REPEAT

UNTIL KEYPRESSED;
WRITE (KEYREAD);

WAIT;
END.







