UNIT MouseUnit;
     { MS-MOUSE UNIT Version 1.0
       f〉 TURBO PASCAL 6.0
       von Steffen Ott           }

INTERFACE
PROCEDURE InitMouse;           { Initialisieren der Maus                   }
FUNCTION GetMouseX:WORD;       { Gibt die X-Koordinate der Maus zur…k     }
FUNCTION GetMouseY:WORD;       { Gibt die Y-Koordinate der Maus zur…k     }
FUNCTION GetMouseButton:BYTE;  { Gibt die Gedr…kte(n) Maustaste(n) zur…k }
FUNCTION MouseInit:BOOLEAN;    { Gibt TRUE zur…k wenn Maus initialisiert  }
FUNCTION MouseBInit:WORD;      { Gibt zur…k wieviel Tasten die Maus hat   }
PROCEDURE MouseHandler(statusy,statusx,button:WORD);
       {Die Prozedur MOUSEHANDLER gibt die Koordianten und die Tasten
        der Maus schneller zur…k als die drei Funktionen GETMOUSEX,
        GETMOUSEY und GETMOUSEBUTTON. Doch die Ausgabe dieser drei
        Funktionen und der Procedur MOUSEHANDLER sind gleich. }
{Tabelle der Gedr…kten Maustasten:
   Linke Maustaste = LM   Rechte Maustaste = RM   Mittlere Maustaste = MM

          LM = 1     LM + RM = 3   LM + RM + MM = 7
          RM = 2     LM + MM = 5
          MM = 4     RM + MM = 6                                          }


IMPLEMENTATION
{ﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄ}
PROCEDURE InitMouse;
BEGIN
 ASM
  MOV AX,0000h
  INT 33h
 END;
END;
{ﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄ}
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
{ﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄ}
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
{ﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄ}
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
{ﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄ}
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
{ﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄ}
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
{ﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄ}
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
{ﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄﾄ}

BEGIN
END.
