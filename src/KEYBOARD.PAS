{****************************************************************************
 ****                                                                    ****
 ****       KEYBOARD.PAS                                                 ****
 ****                                                                    ****
 **** ist eine UNIT Datei mit DREI-Funktionen um Zeichen von der         ****
 **** Tastatur zu lesen. In der Datei KEYBOARD.TXT wird n„her auf die    ****
 **** Befehle eingegangen.                                               ****
 ****                                                                    ****
 ****************************************************************************
 ****                                                                    ****
 ****   COPYRIGHT 1997  Steffen Ott                                      ****
 ****                   Marderweg 8                                      ****
 ****                   78532 Tuttlingen                                 ****
 ****                                                                    ****
 ****************************************************************************}

UNIT Keyboard;

INTERFACE
FUNCTION Inkey:WORD;
FUNCTION KeyStat:BYTE;
FUNCTION BufTest:WORD;

IMPLEMENTATION
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

BEGIN
END.

