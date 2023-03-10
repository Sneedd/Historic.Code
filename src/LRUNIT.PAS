{F+}
UNIT LRUNIT;

INTERFACE
USES CRT,DOS;
TYPE COLPAL = ARRAY[1..5] OF BYTE;
     ANWEND = ARRAY[1..5] OF STRING;
PROCEDURE Filler(Col:BYTE;Ch:CHAR);
FUNCTION  RDRS(nb:BYTE):BOOLEAN;
PROCEDURE ShowMouseCursor;   
PROCEDURE HideMouseCursor;   
FUNCTION  GetMouseX:WORD;    
FUNCTION  GetMouseY:WORD;    
FUNCTION  GetMouseButton:BYTE;
PROCEDURE Color(t,b:BYTE); 
PROCEDURE PButton(x,y,bl:BYTE;Col:COLPAL;name:STRING;spezial:BYTE);
PROCEDURE TextBox(TxtCol,TxtBkg,BoxX,BoxY:BYTE); 
PROCEDURE TextBar(TxtCol, TxtBackground:BYTE; TextPrint:STRING);
function FileExists(FileName: string) : Boolean;


IMPLEMENTATION
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
PROCEDURE TextBox(TxtCol,TxtBkg,BoxX,BoxY:BYTE);  {Malt einen Kasten im      }
   VAR vx,vy,g,BoxX0,BoxY0:BYTE;                  {Textmodus wo die Zeichen  }
   BEGIN                                          {von 80x25 benutzt werden  }
      TEXTCOLOR(TxtCol);TEXTBACKGROUND(TxtBkg);   {Die ersten zwei Konstanten}
      BoxX0 := (80 - BoxX) DIV 2;                 {sind f걊 die Text- und    }
      BoxY0 := (25 - BoxY) DIV 2;                 {Hintergrundfarbe. Die     }
      GOTOXY(BoxX0,BoxY0); WRITE ('?');           {n꼊hsten zwei sind f걊    }
      FOR vx := BoxX0 +1 TO BoxX0 + BoxX DO       {die Gr붳e der TextBox     }
        BEGIN                                     {werden Sie aber nicht     }
          GOTOXY(vx ,BoxY0); WRITE ('?');         {gr붳er als 70x22 und nicht}
        END;                                      {kleiner als 10x10.        }
      GOTOXY(BoxX0+BoxX+1,BoxY0); WRITE ('?');    {Alles Klar ?!?            }
      BoxY0 := BoxY0 + 1;                         {                          }
      FOR vy := BoxY0 TO BoxY0 + BoxY DO          {                          }
        BEGIN                                     {                          }
          GOTOXY(BoxX0,vy); WRITE ('?');          {                          }
          FOR vx := BoxX0 + 1 TO BoxX0 + BoxX DO  {                          }
            BEGIN                                 {                          }
              GOTOXY(vx, vy);                     {                          }
              WRITE (' ');                        {                          }
            END;                                  {                          }
          GOTOXY(BoxX0+BoxX+1,vy); WRITE ('?');   {                          }
        END;                                      {                          }
      BoxY0 := BoxY0 + BoxY;                      {                          }
      GOTOXY(BoxX0,BoxY0); WRITE ('?');           {                          }
      FOR vx := BoxX0 + 1 TO BoxX0 + BoxX DO      {                          }
        BEGIN                                     {                          }
          GOTOXY(vx,BoxY0); WRITE ('?');          {                          }
        END;                                      {                          }
      GOTOXY(BoxX0+BoxX+1,BoxY0); WRITE ('?');    {                          }
   END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
PROCEDURE PButton(x,y,bl:BYTE;Col:COLPAL;name:STRING;spezial:BYTE);
VAR i:WORD;
BEGIN
 Color(Col[2],Col[1]); GOTOXY(x,y); FOR i := 1 TO bl DO WRITE(' ');
 CASE spezial OF
  0 :Color(Col[2],Col[1]);
  1 :Color(Col[3],Col[1]);
  2 :Color(Col[4],Col[1]);
 END;
 GOTOXY(x +((bl DIV 2)-LENGTH(name) DIV 2), y); WRITE(name);
 Color(Col[5],Col[2]); GOTOXY(x+bl,y); WRITE('?');
 Color(Col[5],Col[2]); GOTOXY(x+1,y+1); FOR i := 1 TO bl DO WRITE('?');
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
PROCEDURE Color(t,b:BYTE); BEGIN; TEXTCOLOR(t); TEXTBACKGROUND(b); END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
PROCEDURE TextBar(TxtCol, TxtBackground:BYTE; TextPrint:STRING);
VAR v:BYTE;
BEGIN
 TEXTCOLOR(TxtCol); TEXTBACKGROUND(TxtBackground);
 GOTOXY (1,1); FOR v := 1 TO 80 DO WRITE ('?');
 GOTOXY (40-LENGTH(TextPrint) DIV 2, 1); WRITE (' ', TextPrint, ' ');
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
function FileExists(FileName: string) : Boolean;
var
  f: file;
begin
  {$I-}
  Assign(f, FileName);
  Reset(f);
  Close(f);
  {$I+}
  FileExists := (IOResult = 0) and
   (FileName <> '');
end;  { FileExists }



{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
PROCEDURE Filler(Col:BYTE;Ch:CHAR);
VAR i : WORD;
BEGIN
 FOR i := 0 TO 4000 DO MEM[$B800:i] := Col;
 FOR i := 0 TO 2000 DO MEM[$B800:i*2] := ORD(Ch);
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
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
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
PROCEDURE ShowMouseCursor;   {Version 1.0+}
BEGIN
 ASM
  MOV    AX,0001h
  INT    33h
 END;
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
PROCEDURE HideMouseCursor;   {Version 1.0+}
BEGIN
 ASM
  MOV    AX,0002h
  INT    33h
 END;
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
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
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
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
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
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


BEGIN
END.
