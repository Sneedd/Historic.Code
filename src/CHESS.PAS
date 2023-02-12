PROGRAM DosTextChess;
USES ChessData, ChessMoves, Textunit, Crt, Dos;
TYPE
 ChessPlate = ARRAY[1..8,1..8] of BYTE;
 Info = STRING[100];

PROCEDURE SetupPlate;
 BEGIN
  ChessPlate[1,1] := 2;  ChessPlate[2,1] := 1;  ChessPlate[3,1] := 0;  ChessPlate[4,1] := 0;  ChessPlate[5,1] := 0;
  ChessPlate[6,1] := 0;  ChessPlate[7,1] := 7;  ChessPlate[8,1] := 8;
  ChessPlate[1,2] := 3;  ChessPlate[2,2] := 1;  ChessPlate[3,2] := 0;  ChessPlate[4,2] := 0;  ChessPlate[5,2] := 0;
  ChessPlate[6,2] := 0;  ChessPlate[7,2] := 7;  ChessPlate[8,2] := 9;
  ChessPlate[1,3] := 4;  ChessPlate[2,3] := 1;  ChessPlate[3,3] := 0;  ChessPlate[4,3] := 0;  ChessPlate[5,3] := 0;
  ChessPlate[6,3] := 0;  ChessPlate[7,3] := 7;  ChessPlate[8,3] := 10;
  ChessPlate[1,4] := 6;  ChessPlate[2,4] := 1;  ChessPlate[3,4] := 0;  ChessPlate[4,4] := 0;  ChessPlate[5,4] := 0;
  ChessPlate[6,4] := 0;  ChessPlate[7,4] := 7;  ChessPlate[8,4] := 12;
  ChessPlate[1,5] := 5;  ChessPlate[2,5] := 1;  ChessPlate[3,5] := 0;  ChessPlate[4,5] := 0;  ChessPlate[5,5] := 0;
  ChessPlate[6,5] := 0;  ChessPlate[7,5] := 7;  ChessPlate[8,5] := 11;
  ChessPlate[1,6] := 4;  ChessPlate[2,6] := 1;  ChessPlate[3,6] := 0;  ChessPlate[4,6] := 0;  ChessPlate[5,6] := 0;
  ChessPlate[6,6] := 0;  ChessPlate[7,6] := 7;  ChessPlate[8,6] := 10;
  ChessPlate[1,7] := 3;  ChessPlate[2,7] := 1;  ChessPlate[3,7] := 0;  ChessPlate[4,7] := 0;  ChessPlate[5,7] := 0;
  ChessPlate[6,7] := 0;  ChessPlate[7,7] := 7;  ChessPlate[8,7] := 9;
  ChessPlate[1,8] := 2;  ChessPlate[2,8] := 1;  ChessPlate[3,8] := 0;  ChessPlate[4,8] := 0;  ChessPlate[5,8] := 0;
  ChessPlate[6,8] := 0;  ChessPlate[7,8] := 7;  ChessPlate[8,8] := 8;
 END;

PROCEDURE PutFigures;
 BEGIN

 END;

VAR
 SizeMax: LONGINT;
 CID,CED,CI,CE :BYTE;
 
BEGIN
 SizeMax := SIZEOF(ChessPlate)+SIZEOF(SizeMax)+SIZEOF(CID)+SIZEOF(CED)+SIZEOF(CI)+SIZEOF(CE);
 IF MAXAVAIL < SIZEOF(SizeMax) THEN
  BEGIN
   WRITELN('Not enough memory');
   HALT(0);
  END;
 CLRSCR;
 TEXTBAR(1,15,'Schach System Check v1.0'); GB;
 GOTOXY(1,2); WRITELN(' Speicher:   ', MAXAVAIL,' Bytes');
 GOTOXY(1,3); WRITELN(' Ben”tigter: ', SizeMax,' Bytes');
 GOTOXY(1,4); WRITELN(' ChessPlate: ', SIZEOF(ChessPlate),' Bytes'); Delay(200);
 CLRSCR;
 {WRITE('Computer Intelligenz aus Daten(1 = Dumm, 100 = Schlau): '); READLN(CID);
 WRITE('Computer Erfahrung aus Daten(1 = Keine, 100 = Viel): '); READLN(CED);
 WRITE('Computer Intelligenz (1 = Keine, 100 = Viel): '); READLN(CI);
 WRITE('Computer Erfahrung (1 = Keine, 100 = Viel): '); READLN(CE);}
 SETUPPLATE;
 BG;
 PlayGround;
 BR;
 PutFigures;

END.