UNIT MouseUnit;
     { MS-MOUSE UNIT Version 1.0
       f�r TURBO PASCAL 6.0
       von Steffen Ott           }

INTERFACE
PROCEDURE InitMouse;           { Initialisieren der Maus                   }
FUNCTION GetMouseX:WORD;       { Gibt die X-Koordinate der Maus zur�ck     }
FUNCTION GetMouseY:WORD;       { Gibt die Y-Koordinate der Maus zur�ck     }
FUNCTION GetMouseButton:BYTE;  { Gibt die Gedr�ckte(n) Maustaste(n) zur�ck }
FUNCTION MouseInit:BOOLEAN;    { Gibt TRUE zur�ck wenn Maus initialisiert  }
FUNCTION MouseBInit:WORD;      { Gibt zur�ck wieviel Tasten die Maus hat   }
PROCEDURE MouseHandler(statusy,statusx,button:WORD);
       {Die Prozedur MOUSEHANDLER gibt die Koordianten und die Tasten
        der Maus schneller zur�ck als die drei Funktionen GETMOUSEX,
        GETMOUSEY und GETMOUSEBUTTON. Doch die Ausgabe dieser drei
        Funktionen und der Procedur MOUSEHANDLER sind gleich. }
{Tabelle der Gedr�ckten Maustasten:
   Linke Maustaste = LM   Rechte Maustaste = RM   Mittlere Maustaste = MM

          LM = 1     LM + RM = 3   LM + RM + MM = 7
          RM = 2     LM + MM = 5
          MM = 4     RM + MM = 6                                          }


IMPLEMENTATION
{������������������������������������������������������������������������}
PROCEDURE InitMouse;
BEGIN
 ASM
  MOV AX,0000h
  INT 33h
 END;
END;
{������������������������������������������������������������������������}
FUNCTION GetMouseX:WORD;
VAR status:WORD;
BEGIN
 ASM
  MOV AX, 0003h
  INT 33h
  MOV [status],CX
 END;
 GetMouseX := status;
END;
{������������������������������������������������������������������������}
FUNCTION GetMouseY:WORD;
VAR status:WORD;
BEGIN
 ASM
  MOV AX, 0003h
  INT 33h
  MOV [status],DX
 END;
 GetMouseY := status;
END;
{������������������������������������������������������������������������}
FUNCTION GetMouseButton:BYTE;
VAR status:WORD;
BEGIN
 ASM
  MOV AX, 0003h
  INT 33h
  MOV [status],BX
 END;
 GetMouseButton := status;
END;
{������������������������������������������������������������������������}
FUNCTION MouseInit:BOOLEAN;
VAR status:WORD;
BEGIN
 ASM
  MOV AX,0000h
  INT 33h
  MOV [status],AX
 END;
 MouseInit := Status = $FFFF;
END;
{������������������������������������������������������������������������}
FUNCTION MouseBInit:WORD;
VAR status:WORD;
BEGIN
 ASM
  MOV AX,0000h
  INT 33h
  MOV [status],BX
 END;
 MouseBInit := status;
END;
{������������������������������������������������������������������������}
PROCEDURE MouseHandler(statusy,statusx,button:WORD);
BEGIN
 ASM
  MOV AX, 0003h
  INT 33h
  MOV [button],BX
  MOV [statusx],CX
  MOV [statusy],DX
 END;
END;
{������������������������������������������������������������������������}

BEGIN
END.