PROGRAM CPPEditor;  
USES DOS,CRT,ASMO;

PROCEDURE Filler(Col:BYTE;Ch:CHAR);
VAR i : WORD;
BEGIN
 FOR i := 0 TO 4000 DO MEM[$B800:i] := Col;
 FOR i := 0 TO 2000 DO MEM[$B800:i*2] := ORD(Ch);
END;

BEGIN
 Filler($17,'±');
 TextBox($7,$1,76,10);
 TextBar($1,$7,'Bestimmungsort Unbekannt');
 ShowMouseCursor;
 Color(7,1);
 GOTOXY(5,9);
 WRITELN('Willkommen in der Zukunft, einer m”glichen Zukunft der Menschheit.');
 WRITELN('Wissenschaftler spalten mit Hilfe einer neuen Methode radioaktives');
 WRITELN('Material. Diese Methode, jedoch stellt sich als zu gef„hrlich her-');
 WRITELN('aus  und wird deshalb  gestoppt. Da man Ausl„ndischen Regieirungen');
 WRITELN('nicht vorschreiben kann, macht Russland weiter solche Versuche als');
 WRITELN('ein Versuch schief geht und die halbe Erde verseucht und dazu eine');
 WRITELN('Impusion ausgel”st hat.

 REPEAT
 GOTOXY(1,1);

 UNTIL KEYPRESSED;
END.
