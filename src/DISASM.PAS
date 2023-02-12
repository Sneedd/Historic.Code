PROGRAM DisAssembler;
USES crt,dos,math,asmo;
{TYPE op = ARRAY[0..65534] OF BYTE;

PROCEDURE WriteChar(x,y:BYTE;ch:CHAR;col:BYTE);
BEGIN
 MEM[$B800:(x+(y*80))*2+1]:=Col;
 MEM[$B800:(x+(y*80))*2]:=ORD(ch);
END;

PROCEDURE WriteString(x,y:BYTE;strg:STRING;col:BYTE);
VAR ch :STRING; i:BYTE;
BEGIN
 FOR i := 0 TO LENGTH(strg) DO BEGIN
 ch := COPY(strg,i,1);
 WriteChar(x+i,y,ch,col);
END;}
FUNCTION Dec2HexN(Dez:BYTE):CHAR;
BEGIN
 IF dez =  0 THEN Dec2HexN := '0';
 IF dez =  1 THEN Dec2HexN := '1';
 IF dez =  2 THEN Dec2HexN := '2';
 IF dez =  3 THEN Dec2HexN := '3';
 IF dez =  4 THEN Dec2HexN := '4';
 IF dez =  5 THEN Dec2HexN := '5';
 IF dez =  6 THEN Dec2HexN := '6';
 IF dez =  7 THEN Dec2HexN := '7';
 IF dez =  8 THEN Dec2HexN := '8';
 IF dez =  9 THEN Dec2HexN := '9';
 IF dez = 10 THEN Dec2HexN := 'A';
 IF dez = 11 THEN Dec2HexN := 'B';
 IF dez = 12 THEN Dec2HexN := 'C';
 IF dez = 13 THEN Dec2HexN := 'D';
 IF dez = 14 THEN Dec2HexN := 'E';
 IF dez = 15 THEN Dec2HexN := 'F';
END;


FUNCTION Dec2Hex(Dez:LONGINT):STRING;
VAR Op :LONGINT;
    Hexstring :STRING;
BEGIN
 Op := Dez;
 REPEAT
  Op := Op DIV 16;
 UNTIL Op < 16;
 Hexstring := Hexstring + Dec2HexN(Op);


 Dec2Hex := Hexstring;
END;


VAR x:BYTE;
BEGIN
 ASM
  MOV AX,0003h
  INT 10h
 END;

 WriteLn;
 WriteLn(Dec2Hex(188));
{ WriteChar(79,24,'±',$74);
 WriteString(0,2,'Localsize',$74);}
 





END.
