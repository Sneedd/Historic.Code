UNIT MSMouseHandlers;   {MS-MOUSE UNIT Version 2.0
                         fЃr Turbo Pascal 6.0
                         Steffen Ott                                                    }
{!Hinweis!  Der Maustreiber muб 6.0 oder h”her sein.                                    }

INTERFACE
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

IMPLEMENTATION
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
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
PROCEDURE ShowMouseCursor;   {Version 1.0+}
BEGIN
 ASM
  MOV    AX,0001h
  INT    33h
 END;
END;
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
PROCEDURE HideMouseCursor;   {Version 1.0+}
BEGIN
 ASM
  MOV    AX,0002h
  INT    33h
 END;
END;
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
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
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
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
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
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
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
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
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
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
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
PROCEDURE LPE_ON; {Version 1.0+}
BEGIN
 ASM;
  MOV AX,000Dh;
  INT 33h;
 END;
END;
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
PROCEDURE LPE_OFF; {Version 1.0+}
BEGIN
 ASM;
  MOV AX,000Eh;
  INT 33h;
 END;
END;
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
PROCEDURE SetMousePos(col,row:WORD); {Version 1.0+}
BEGIN
 ASM
  MOV AX, 0004h
  MOV CX, [col]
  MOV DX, [row]
  INT 33h
 END;
END;
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
PROCEDURE DefColRange(min,max:WORD); {Version 1.0+}
BEGIN
 ASM
  MOV AX, 0007h
  MOV CX, [min]
  MOV DX, [max]
  INT 33h
 END;
END;
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
PROCEDURE DefRowRange(min,max:WORD);  {Version 1.0+}
BEGIN
 ASM
  MOV AX, 0008h
  MOV CX, [min]
  MOV DX, [max]
  INT 33h
 END;
END;
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
PROCEDURE DefPageNum(pagenum:WORD);          {Version 6.0+}
BEGIN
 ASM
  MOV AX, 001Dh
  MOV BX, [pagenum]
  INT 33h
 END;
END;
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
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
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
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
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
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
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
PROCEDURE SetMouseLanguage(lag:WORD); {Version 6.0+}
BEGIN
 ASM
  MOV AX,0022h
  MOV BX,[lag]
  INT 33h
 END;
END;
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
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
{ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД}
PROCEDURE DefineGraphicsCursor;   {Version 3.0+}
BEGIN
 ASM
  MOV AX,0009h


  INT 33h
 END;
END;







BEGIN
END.







































