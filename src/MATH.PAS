UNIT Math;
(****************************************************************************
 ****                                                                    ****
 ****    MATH.TPU   -   Turbo Pascal Unit                                ****
 ****                                                                    ****
 ****************************************************************************
 ****                                                                    ****
 ****  Diese Unit enth„lt mathematische Funktionen und Zahlensystem-     ****
 ****  umwandler, die in der SYSTEM.TPU von Turbo Pascal nicht berck-   ****
 ****  sichtig worden sind.                                              ****
 ****                                                                    ****
 ****************************************************************************)

INTERFACE
FUNCTION Hoch(x:WORD;h:BYTE):LONGINT;
FUNCTION Hex2Dec(Hexstring:STRING):LONGINT;
FUNCTION Hex2Bin(Hexstring:STRING):STRING;
FUNCTION Bin2Dec(Binstring:STRING):LONGINT;
FUNCTION Bin2Hex(Binstring:STRING):STRING;
FUNCTION SGN(a:REAL):INTEGER;                   (*** Signum, Vorzeichen ***)
FUNCTION TAN(x: real): real;                    (*** Tangens            ***)
FUNCTION SEC(x: real): real;                    (*** Sekans             ***)
FUNCTION CSC(x: real): real;                    (*** Cosekans           ***)
FUNCTION COT(x: real): real;                    (*** Cotangens          ***)
FUNCTION ARCSIN(x: real): real;                 (*** Arcussinus         ***)
FUNCTION ARCCOS(x: real): real;                 (*** Arcuscosinus       ***)
FUNCTION ARCCOT(x: real): real;                 (*** Arcuscotangens     ***)
FUNCTION ARCSEC(x: real): real;                 (*** Arcussekans        ***)
FUNCTION ARCCSC(x: real): real;                 (*** Arcuscosecans      ***)


IMPLEMENTATION
FUNCTION TAN(x: real): real; BEGIN TAN := SIN(x)/COS(x); END;
FUNCTION SEC(x: real): real; BEGIN SEC := 1/COS(x); END;
FUNCTION CSC(x: real): real; BEGIN CSC := 1/SIN(x); END;
FUNCTION COT(x: real): real; BEGIN COT := 1/TAN(x); END;
FUNCTION ARCSIN(x: real): real; BEGIN ARCSIN := ARCTAN(x/SQRT(1-SQR(x))); END;
FUNCTION ARCCOS(x: real): real; BEGIN ARCCOS := -ARCTAN(x/SQRT(1-SQR(x)))+1.57079632679415; END;
FUNCTION ARCCOT(x: real): real; BEGIN ARCCOT := ARCTAN(x)+1.57079632679415; END;
FUNCTION ARCSEC(x: real): real; BEGIN ARCSEC := ARCTAN(x/SQRT(SQR(x))-1); END;
FUNCTION ARCCSC(x: real): real; BEGIN ARCCSC := ARCTAN(x/SQRT(SQR(x)-1))+(SGN(x)-1)*1.57079632679415; END;

FUNCTION sgn(a:REAL):INTEGER;
BEGIN
 IF a>0 THEN sgn:=+1;
 IF a<0 THEN sgn:=-1;
 IF a=0 THEN sgn:=0;
END;


FUNCTION Hoch(x:WORD;h:BYTE):LONGINT;
VAR i:BYTE; k :LONGINT;
BEGIN
 IF h = 0 THEN BEGIN Hoch := 1; EXIT; END;
 k := x;
 FOR i := 1 TO h -1 DO k := k * x;
 Hoch := k;
END;

FUNCTION Hex2Dec(Hexstring:STRING):LONGINT;
VAR i,Lh,mult :BYTE;
    Strg :STRING;
    Ch   :CHAR;
    x,z  :LONGINT;
BEGIN
 z := 0;
 Lh := LENGTH(Hexstring);
 FOR i := 0 TO Lh-1 DO
 BEGIN
  Strg := Hexstring;
  Strg := COPY(Strg,Lh-i,1);
  IF Strg = '0' THEN mult := 0;
  IF Strg = '1' THEN mult := 1;
  IF Strg = '2' THEN mult := 2;
  IF Strg = '3' THEN mult := 3;
  IF Strg = '4' THEN mult := 4;
  IF Strg = '5' THEN mult := 5;
  IF Strg = '6' THEN mult := 6;
  IF Strg = '7' THEN mult := 7;
  IF Strg = '8' THEN mult := 8;
  IF Strg = '9' THEN mult := 9;
  IF Strg = 'A' THEN mult := 10;
  IF Strg = 'B' THEN mult := 11;
  IF Strg = 'C' THEN mult := 12;
  IF Strg = 'D' THEN mult := 13;
  IF Strg = 'E' THEN mult := 14;
  IF Strg = 'F' THEN mult := 15;
  x := Hoch(16,i) * mult;
  z := z + x;
  Hex2Dec := z;
 END;
END;

FUNCTION Hex2Bin(Hexstring:STRING):STRING;
VAR Lb,i:BYTE;
    Strg,op,binstring:STRING;
BEGIN
 op := '';
 Lb := LENGTH(Hexstring);
 FOR i := Lb-1 DOWNTO 0 DO
 BEGIN
  Strg := Hexstring;
  Strg := COPY(Strg,Lb-i,1);
  IF Strg = '0' THEN binstring := '0000';
  IF Strg = '1' THEN binstring := '0001';
  IF Strg = '2' THEN binstring := '0010';
  IF Strg = '3' THEN binstring := '0011';
  IF Strg = '4' THEN binstring := '0100';
  IF Strg = '5' THEN binstring := '0101';
  IF Strg = '6' THEN binstring := '0110';
  IF Strg = '7' THEN binstring := '0111';
  IF Strg = '8' THEN binstring := '1000';
  IF Strg = '9' THEN binstring := '1001';
  IF Strg = 'A' THEN binstring := '1010';
  IF Strg = 'B' THEN binstring := '1011';
  IF Strg = 'C' THEN binstring := '1100';
  IF Strg = 'D' THEN binstring := '1101';
  IF Strg = 'E' THEN binstring := '1110';
  IF Strg = 'F' THEN binstring := '1111';
  op := op + binstring;
 END;
 Hex2Bin := op;
END;

FUNCTION Bin2Dec(Binstring:STRING):LONGINT;
VAR i,Lb,mult :BYTE;
    Strg :STRING;
    Ch   :CHAR;
    x,z  :LONGINT;
BEGIN
 z := 0;
 Lb := LENGTH(Binstring);
 FOR i := 0 TO Lb-1 DO
 BEGIN
  Strg := Binstring;
  Strg := COPY(Strg,Lb-i,1);
  IF Strg = '0' THEN mult := 0;
  IF Strg = '1' THEN mult := 1;
  x := Hoch(2,i) * mult;
  z := z + x;
  Bin2Dec := z;
 END;
END;

FUNCTION Bin2Hex(Binstring:STRING):STRING;
VAR Lb,i:BYTE;
    Strg,op,hexstring:STRING;
BEGIN
 op := '';
 Lb := LENGTH(Binstring)DIV 4;
 FOR i := 0 TO Lb-1 DO
 BEGIN
  Strg := Binstring;
  Strg := COPY(Strg,(Lb+i*4)-2,4);
  IF Strg = '0000' THEN hexstring := '0';
  IF Strg = '0001' THEN hexstring := '1';
  IF Strg = '0010' THEN hexstring := '2';
  IF Strg = '0011' THEN hexstring := '3';
  IF Strg = '0100' THEN hexstring := '4';
  IF Strg = '0101' THEN hexstring := '5';
  IF Strg = '0110' THEN hexstring := '6';
  IF Strg = '0111' THEN hexstring := '7';
  IF Strg = '1000' THEN hexstring := '8';
  IF Strg = '1001' THEN hexstring := '9';
  IF Strg = '1010' THEN hexstring := 'A';
  IF Strg = '1011' THEN hexstring := 'B';
  IF Strg = '1100' THEN hexstring := 'C';
  IF Strg = '1101' THEN hexstring := 'D';
  IF Strg = '1110' THEN hexstring := 'E';
  IF Strg = '1111' THEN hexstring := 'F';
  op := op + hexstring;
 END;
 Bin2Hex := op;
END;

BEGIN
END.