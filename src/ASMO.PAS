UNIT ASMO;            {Meine eigene UNIT in der alle von mir geschriebenen
                       FUNKTIONEN und PROZEDUREN drin sind.}


INTERFACE
USES crt,dos;
TYPE
  COLPAL = ARRAY[1..5] OF BYTE;
PROCEDURE TextBox(TxtCol,TxtBkg,BoxX,BoxY:BYTE);
PROCEDURE TextBar(TxtCol, TxtBackground:BYTE; TextPrint:STRING);
FUNCTION  Inkey:WORD;
FUNCTION  KeyStat:BYTE;
FUNCTION  BufTest:WORD;
FUNCTION  ReadKeyPort:BYTE;        {Siehe KeyCode Tabelle 1}
FUNCTION  RDRS(nb:BYTE):BOOLEAN;  {Reset Driver and Read Status}
PROCEDURE ShowMouseCursor;                   {Version 1.0+}
PROCEDURE HideMouseCursor;                   {Version 1.0+}
FUNCTION  GetMouseX:WORD;                    {Version 1.0+}
FUNCTION  GetMouseY:WORD;                    {Version 1.0+}
FUNCTION  GetMouseButton:BYTE;               {Version 1.0+}
PROCEDURE GetMouseSensitivity(h,v,d:WORD);   {Version 6.0+}
PROCEDURE SetMouseSensitivity(h,v,d:WORD);   {Version 6.0+}
PROCEDURE LPE_ON;                            {Version 1.0+}
PROCEDURE LPE_OFF;                           {Version 1.0+}
PROCEDURE SetMousePos(col,row:WORD);         {Version 1.0+}
PROCEDURE DefColRange(min,max:WORD);         {Version 1.0+}
PROCEDURE DefRowRange(min,max:WORD);         {Version 1.0+}
PROCEDURE DefPageNum(pagenum:WORD);          {Version 6.0+}
FUNCTION  RetPageNum:WORD;                   {Version 6.0+}
FUNCTION  DisableMouseDriver:BOOLEAN;        {Version 6.0+}
FUNCTION  EnableMouseDriver:BOOLEAN;         {Version 6.0+}
PROCEDURE SetMouseLanguage(lag:WORD);        {Version 6.0+}
FUNCTION  GetMouseLanguage:WORD;             {Version 6.0+}
PROCEDURE PButton(x,y,bl:BYTE;Col:COLPAL;name:STRING);
PROCEDURE Color(t,b:BYTE); 
PROCEDURE Screen(mode:INTEGER);
PROCEDURE PSetA(SetPixX,SetPixY:WORD;SetPixC:BYTE);
PROCEDURE PSet(SetPixX,SetPixY:WORD;SetPixC:BYTE); {Geht nur bei VGA(13)}
FUNCTION  PGetA(GetPixX,GetPixY:WORD):BYTE;
FUNCTION  PGet(SetPixX,SetPixY:WORD):BYTE; {Geht nur bei VGA(13)}
FUNCTION  ScreenR:BYTE;
FUNCTION  sgn(a:REAL):INTEGER;
PROCEDURE Line (a, b, c, d, col:INTEGER);
PROCEDURE Box(BoxX1,BoxY1,BoxX2,BoxY2:WORD;BoxC:BYTE);
PROCEDURE BoxFill(BoxX1,BoxY1,BoxX2,BoxY2:WORD;BoxC:BYTE);
PROCEDURE cls(col:BYTE);
PROCEDURE AsmoVoxPal256;
PROCEDURE AsmoChessPal256;
PROCEDURE AsmoGrayPal256;
PROCEDURE SetPal(ColorNo : Byte; R,G,B : Byte);
PROCEDURE PPIC(xn,yn,x,y:INTEGER;datname:STRING);
FUNCTION  FileExists(FileName: STRING): BOOLEAN;





IMPLEMENTATION
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
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
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE PPIC(xn,yn,x,y:INTEGER;datname:STRING);
VAR f:TEXT;
    Temp1,Temp2:WORD;
    Temp1C:CHAR;
    Color:BYTE;
BEGIN
  ASSIGN(f,datname);
  RESET(f);
    FOR Temp2 := 0 TO xn DO BEGIN
      FOR Temp1 := yn DOWNTO 0 DO BEGIN
        READ(f,Temp1C);
        Color := ORD(Temp1C);
        IF Color <> 255 THEN PSET(x+Temp2,y+Temp1,Color);
      END;
    END;
  CLOSE(f);
END;

{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE AsmoVoxPal256;
 VAR a:BYTE;
 BEGIN
  FOR a := 0 TO 255 DO
   BEGIN
    SetPal (a,a SHR 2,a SHR 2, a SHR 2)
   END;
 END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE AsmoChessPal256;
 VAR a:BYTE;
 BEGIN
  FOR a := 0 TO 64 DO
   BEGIN
    SetPal (a,a,a,a);             {Grau Farben   }
    SetPal (a+64,a+64,0,0);       {Rot Farben    }
    SetPal (a+128,0,a+128,0);     {Grn Farben   }
    SetPal (a+192,0,0,a+192);     {Blau Farben   }
   END;
 END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE AsmoGrayPal256;
 VAR a:BYTE;
 BEGIN
  FOR a := 0 TO 255 DO
   BEGIN
    SetPal (a,a DIV 4,a DIV 4,a DIV 4);             {Grau Farben   }
   END;
 END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE SetPal(ColorNo : Byte; R,G,B : Byte);
Begin
   Port[$3c8] := ColorNo;
   Port[$3c9] := R;
   Port[$3c9] := G;
   Port[$3c9] := B;
End;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE Screen(mode:INTEGER);
   BEGIN
     ASM
      MOV AX, [mode]
      INT 10h
     END;
     WRITE;
   END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE PSetA(SetPixX,SetPixY:WORD;SetPixC:BYTE);
   BEGIN
     ASM
      MOV AH, 12
      MOV DX, [SetPixY]
      MOV CX, [SetPixX]
      MOV AL, [SetPixC]
      INT 10h
     END;
   END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE PSet(SetPixX,SetPixY:WORD;SetPixC:BYTE); {Geht nur bei VGA(13)}
  BEGIN
  MEM [$A000:SetPixX+(SetPixY*320)]:=SetPixC;
  END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
FUNCTION PGetA(GetPixX,GetPixY:WORD):BYTE;
   VAR op:BYTE;
   BEGIN
     ASM
      MOV AH,13
      MOV DX, [GetPixY]
      MOV CX, [GetPixX]
      INT 10h
      MOV [op], AL
     END;
    PGetA := op;
   END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
FUNCTION PGet(SetPixX,SetPixY:WORD):BYTE; {Geht nur bei VGA(13)}
  BEGIN
  PGet := MEM [$A000:SetPixX+(SetPixY*320)];
  END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
FUNCTION ScreenR:BYTE;
   VAR modus:BYTE;
   BEGIN
     ASM
      MOV AH, 15
      INT 10h
      MOV [modus], AL
     END;
   ScreenR := modus;
   END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE Box(BoxX1,BoxY1,BoxX2,BoxY2:WORD;BoxC:BYTE);
   VAR vx,vy:BYTE;
   BEGIN
     FOR vx := BoxX1 TO BoxX2 DO PSET (vx,BoxY1,BoxC);
     FOR vy := BoxY1 TO BoxY2 DO PSET (vx,vy,BoxC);
     FOR vx := BoxX2 DOWNTO BoxX1 DO PSET (vx,BoxY2,BoxC);
     FOR vy := BoxY2 DOWNTO BoxY1 DO PSET (BoxX1,vy,BoxC);
   END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE BoxFill(BoxX1,BoxY1,BoxX2,BoxY2:WORD;BoxC:BYTE);
   VAR vx,vy:BYTE;
   BEGIN
     FOR vy := BoxY1 TO BoxY2 DO
      BEGIN
        FOR vx := BoxX1 TO BoxX2 DO PSET (vx,vy,BoxC);
      END;
   END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
FUNCTION sgn(a:REAL):INTEGER;
     BEGIN
          IF a>0 THEN sgn:=+1;
          IF a<0 THEN sgn:=-1;
          IF a=0 THEN sgn:=0;
     END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE Line (a, b, c, d, col:INTEGER);
  VAR u,s,v,d1x,d1y,d2x,d2y,m,n:REAL;
  i:INTEGER;
  BEGIN
     u:= c - a; v:= d - b;
     d1x:= SGN(u); d1y:= SGN(v);
     d2x:= SGN(u); d2y:= 0;
     m:= ABS(u); n := ABS(v);
     IF NOT (M>N) THEN
     BEGIN
       d2x := 0;
       d2y := SGN(v);
       m := ABS(v);
       n := ABS(u);
     END;
     s := INT(m / 2);
     FOR i := 0 TO ROUND(m) DO
     BEGIN
          PSET(a,b,col);
          s := s + n;
          IF not (s<m) THEN
          BEGIN
            s := s - m;
            a := a + ROUND(d1x);
            b := b + ROUND(d1y);
          END
          ELSE
          BEGIN
            a := a + ROUND(d2x);
            b := b + ROUND(d2y);
          END;
     END;
END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE cls(col:BYTE);
 BEGIN
  FILLCHAR (MEM [$A000:0],64000,col);
 END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE PButton(x,y,bl:BYTE;Col:COLPAL;name:STRING);
VAR i:WORD;
BEGIN
 Color(Col[2],Col[1]); GOTOXY(x,y); FOR i := 1 TO bl DO WRITE(' ');
 Color(Col[2],Col[1]); GOTOXY(x +((bl DIV 2)-LENGTH(name) DIV 2), y); WRITE(name);
 Color(Col[5],Col[2]); GOTOXY(x+bl,y); WRITE('Ü');
 Color(Col[5],Col[2]); GOTOXY(x+1,y+1); FOR i := 1 TO bl DO WRITE('฿');
END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE Color(t,b:BYTE); BEGIN; TEXTCOLOR(t); TEXTBACKGROUND(b); END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
FUNCTION RDRS(nb:BYTE):BOOLEAN;  {Reset Driver and Read Status}
VAR op,oq:WORD;
BEGIN
 ASM
  MOV    AX,0000h
  INT    33h
  MOV    [op],AX
  MOV    [oq],BX
 END;
 RDRS := op = $FFFF;
 CASE op OF
  $0000 : nb := 00;
  $0002 : nb := 02;
  $0003 : nb := 03;
  $FFFF : nb := 02;
 END;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
PROCEDURE ShowMouseCursor;   {Version 1.0+}
BEGIN
 ASM
  MOV    AX,0001h
  INT    33h
 END;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
PROCEDURE HideMouseCursor;   {Version 1.0+}
BEGIN
 ASM
  MOV    AX,0002h
  INT    33h
 END;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
FUNCTION GetMouseX:WORD;     {Version 1.0+}
VAR status:WORD;
BEGIN
 ASM
  MOV AX, 0003h
  INT 33h
  MOV [status],CX
 END;
 GetMouseX := status;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
FUNCTION GetMouseY:WORD;     {Version 1.0+}
VAR status:WORD;
BEGIN
 ASM
  MOV AX, 0003h
  INT 33h
  MOV [status],DX
 END;
 GetMouseY := status;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
FUNCTION GetMouseButton:BYTE;{Version 1.0+}
VAR status:WORD;
BEGIN
 ASM
  MOV AX, 0003h
  INT 33h
  MOV [status],BX
 END;
 GetMouseButton := status;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
PROCEDURE GetMouseSensitivity(h,v,d:WORD);  {Version 6.0+}
BEGIN
 ASM
  MOV AX,001Bh
  INT 33h
  MOV [h],BX
  MOV [v],CX
  MOV [d],DX
 END;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
PROCEDURE SetMouseSensitivity(h,v,d:WORD);  {Version 6.0+}
BEGIN
 ASM
  MOV AX,001Ah
  MOV BX,[h]
  MOV CX,[v]
  MOV DX,[d]
  INT 33h
 END;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
PROCEDURE LPE_ON; {Version 1.0+}
BEGIN
 ASM;
  MOV AX,000Dh;
  INT 33h;
 END;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
PROCEDURE LPE_OFF; {Version 1.0+}
BEGIN
 ASM;
  MOV AX,000Eh;
  INT 33h;
 END;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
PROCEDURE SetMousePos(col,row:WORD); {Version 1.0+}
BEGIN
 ASM
  MOV AX, 0004h
  MOV CX, [col]
  MOV DX, [row]
  INT 33h
 END;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
PROCEDURE DefColRange(min,max:WORD); {Version 1.0+}
BEGIN
 ASM
  MOV AX, 0007h
  MOV CX, [min]
  MOV DX, [max]
  INT 33h
 END;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
PROCEDURE DefRowRange(min,max:WORD);  {Version 1.0+}
BEGIN
 ASM
  MOV AX, 0008h
  MOV CX, [min]
  MOV DX, [max]
  INT 33h
 END;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
PROCEDURE DefPageNum(pagenum:WORD);          {Version 6.0+}
BEGIN
 ASM
  MOV AX, 001Dh
  MOV BX, [pagenum]
  INT 33h
 END;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
FUNCTION RetPageNum:WORD;      {Version 6.0+}
VAR op:WORD;
BEGIN
 ASM
  MOV AX,001Eh
  INT 33h
  MOV [op],BX
 END;
 RetPageNum := op;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
FUNCTION DisableMouseDriver:BOOLEAN;  {Version 6.0+}
VAR op:WORD;
BEGIN
 ASM
  MOV AX, 001Fh
  INT 33h
  MOV [op],AX
 END;
 DisableMouseDriver := op = $001F;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
FUNCTION EnableMouseDriver:BOOLEAN; {Version 6.0+}
VAR op:WORD;
BEGIN
 ASM
  MOV AX, 0020h
  INT 33h
  MOV [op], AX
 END;
 EnableMouseDriver := op = $0020;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
PROCEDURE SetMouseLanguage(lag:WORD); {Version 6.0+}
BEGIN
 ASM
  MOV AX,0022h
  MOV BX,[lag]
  INT 33h
 END;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
FUNCTION GetMouseLanguage:WORD;    {Version 6.0+}
VAR op:WORD;
BEGIN
 ASM
  MOV AX,0023h
  INT 33h
  MOV [op],BX
 END;
 GetMouseLanguage := op;
END;
{ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ}
PROCEDURE DefineGraphicsCursor;   {Version 3.0+}
BEGIN
 ASM
  MOV AX,0009h


  INT 33h
 END;
END;



{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
FUNCTION ReadKeyPort:BYTE;
BEGIN
 ReadKeyPort := PORT[$60];
END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
FUNCTION Inkey:WORD;
   VAR op:WORD;
   BEGIN
     ASM
      MOV AH, 0
      INT 16h
      MOV [op],AX
     END;
   Inkey := op;
   END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
FUNCTION KeyStat:BYTE;
   VAR op:BYTE;
   BEGIN
     ASM
      MOV AH,2
      INT 16h
      MOV [op],AL
     END;
   KeyStat := op;
   END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
FUNCTION BufTest:WORD;
   VAR op:WORD;
   BEGIN
     ASM
      MOV AH,1
      INT 16h
      MOV [op],AX
     END;
   BufTest := op;
   END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE TextBox(TxtCol,TxtBkg,BoxX,BoxY:BYTE);
VAR vx,vy,g,BoxX0,BoxY0:BYTE;
BEGIN
 TEXTCOLOR(TxtCol);
 TEXTBACKGROUND(TxtBkg);
 BoxX0 := (80 - BoxX) DIV 2;
 BoxY0 := (25 - BoxY) DIV 2;
 GOTOXY(BoxX0,BoxY0); WRITE ('ษ');
 FOR vx := BoxX0 +1 TO BoxX0 + BoxX DO
 BEGIN
  GOTOXY(vx ,BoxY0);
  WRITE ('อ');
 END;
 GOTOXY(BoxX0+BoxX+1,BoxY0); WRITE ('ป');
 BoxY0 := BoxY0 + 1;
 FOR vy := BoxY0 TO BoxY0 + BoxY DO
 BEGIN
  GOTOXY(BoxX0,vy); WRITE ('บ');
  FOR vx := BoxX0 + 1 TO BoxX0 + BoxX DO
  BEGIN
   GOTOXY(vx, vy);
   WRITE (' ');
  END;
  GOTOXY(BoxX0+BoxX+1,vy); WRITE ('บ');
 END;
 BoxY0 := BoxY0 + BoxY;
 GOTOXY(BoxX0,BoxY0); WRITE ('ศ');
 FOR vx := BoxX0 + 1 TO BoxX0 + BoxX DO
 BEGIN
  GOTOXY(vx,BoxY0);
  WRITE ('อ');
 END;
 GOTOXY(BoxX0+BoxX+1,BoxY0); WRITE ('ผ');
END;
{ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ}
PROCEDURE TextBar(TxtCol, TxtBackground:BYTE; TextPrint:STRING);
VAR v:BYTE;
BEGIN
 TEXTCOLOR(TxtCol); TEXTBACKGROUND(TxtBackground);
 GOTOXY (1,1);
 FOR v := 1 TO 80 DO WRITE ('Û');
 GOTOXY (39-LENGTH(TextPrint) DIV 2, 1);
 WRITE (' ', TextPrint, ' ');
END;

BEGIN
END.