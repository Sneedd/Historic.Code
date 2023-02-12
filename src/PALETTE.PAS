UNIT Palette;

INTERFACE
PROCEDURE SetPal(ColorNo : Byte; R,G,B : Byte);
PROCEDURE AsmoDemoPal256;
PROCEDURE AsmoChessPal256;
PROCEDURE AsmoGrayPal256;
PROCEDURE AsmoInPal256;
PROCEDURE AsmoVoxPal256;

IMPLEMENTATION
PROCEDURE SetPal(ColorNo : Byte; R,G,B : Byte);
Begin
   Port[$3c8] := ColorNo;
   Port[$3c9] := R;
   Port[$3c9] := G;
   Port[$3c9] := B;
End;
PROCEDURE AsmoDemoPal256;
 VAR a:BYTE;
 BEGIN
  FOR a := 0 TO 15 DO
   BEGIN
    SetPal (a,a*4,a*4,a*4);             {Grau Farben   }
    SetPal (a+16,63,63,(a+16)*4);       {Gelb Farben   }
    SetPal (a+32,(a+32)*4,(a+32)*2,0);  {Orange Farben }
    SetPal (a+48,(a+48)*4,0,0);         {Rot Farben    }
    SetPal (a+64,0,(a+64)*4,0);         {GrÅn Farben   }
    SetPal (a+80,0,0,(a+80)*4);         {Blau Farben   }
    {SetPal (a+92,}
   END;
 END;
PROCEDURE AsmoChessPal256;
 VAR a:BYTE;
 BEGIN
  FOR a := 0 TO 64 DO
   BEGIN
    SetPal (a,a,a,a);             {Grau Farben   }
    SetPal (a+64,a+64,0,0);       {Rot Farben    }
    SetPal (a+128,0,a+128,0);     {GrÅn Farben   }
    SetPal (a+192,0,0,a+192);     {Blau Farben   }

   END;
 END;
PROCEDURE AsmoGrayPal256;
 VAR a:BYTE;
 BEGIN
  FOR a := 0 TO 255 DO
   BEGIN
    SetPal (a,a DIV 4,a DIV 4,a DIV 4);             {Grau Farben   }
   END;
 END;
PROCEDURE AsmoInPal256;
 VAR a:BYTE;
 BEGIN
  FOR a := 1 TO 255 DO
   BEGIN
    RANDOMIZE;
    SetPal (a,RANDOM(a),RANDOM(a),RANDOM(a));             {Grau Farben   }
   END;
 END;
PROCEDURE AsmoVoxPal256;
 VAR a:BYTE;
 BEGIN
  FOR a := 0 TO 255 DO
   BEGIN
    SetPal (a,a SHR 2,a SHR 2, a SHR 2)
   END;
 END;

BEGIN
END.
