{****************************************************************************
 ****                                                                    ****
 ****             PASCAL INCLUDE DATEI FšR DOS-INTERRUPTS                ****
 ****                                                                    ****
 ****************************************************************************
 ****                                                                    ****
 **** PASCAL INCLUDE DATEI MIT EINER MENGE VON PROCEDUREN UND FUNKTIONEN ****
 **** DIE MEISTEN PROCEDUREN SIND IN ASSEMBLER MACHE SIND PASCAL DIE     ****
 **** PROCEDUREN UND FUNKTIONEN WERDEN ZUVOR ERKLŽRT WIE SIE FUNKTION-   ****
 **** IEREN. COPYRIGHT 1997 VON STEFFEN OTT                              ****
 ****                           MARDERWEG 8                              ****
 ****                           78532 TUTTLINGEN                         ****
 ****                                                                    ****
 ****************************************************************************}

UNIT pcints;

INTERFACE
PROCEDURE EndProg;
PROCEDURE ScrMode(ScrModeVab:INTEGER);
PROCEDURE SysBoot;

IMPLEMENTATION
PROCEDURE EndProg;
  BEGIN
    ASM
     INT 20h
    END;
  END;

PROCEDURE ScrMode(ScrModeVab:INTEGER);
  BEGIN
    ASM
     MOV AX, ScrModeVab
     INT 10h;
    END;
  END;

PROCEDURE SysBoot;
  BEGIN
    ASM
     INT 19h
    END;
  END;



BEGIN
END.