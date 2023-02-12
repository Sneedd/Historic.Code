PROGRAM GifLoader;

CONST PAN = 'C:\GTA.GIF';

PROCEDURE PSet(x,y:WORD;col:BYTE); assembler;
ASM
   MOV   AX,0A000h         {Segmet-Adresse des VGA-Speichers    }
   MOV   ES,AX             {Speicherung der Segmet-Adresse in ES}
   MOV   AX,320            {Register AX gleich 320 setzen       }
   MUL   [y]               {Multiplizieren von AX mit y         }
   ADD   AX,[x]            {Addieren von x zu AX                }
   MOV   DI,AX             {AX in Offset DI schreiben           }
   MOV   AL,byte ptr [col] {Farbe in AL laden                   }
   MOV   ES:[DI], AL       {Punkt setzen                        }
END;

PROCEDURE SetScreenMode(x:BYTE); assembler;
ASM
   MOV   AH,00h            {Setze AH gleich 00h fÅr die Interrupt Funktion 0}
   MOV   AL,[x]            {Setzte den angegebenen Grafikmodus in AL}
   INT   10h               {Rufen den Interrupt 10h auf}
END;

PROCEDURE ReadGIF(name:STRING); assembler;
VAR handle:WORD;
ASM
   MOV   AX,3D00h
   LEA   DX,[name]
   INT   21h
   MOV   handle,AX



BEGIN
 SetScreenMode($13);
 LoadGif



END.