
 Ü Integer-Typen
 ßßßßßßßßßßßßßßßß
Turbo Pascal stellt fnf vordefinierte
Integer- Typen mit unterschiedlichen
Wertebereichen zur Verfgung:

   Typ     ³       Wertebreich      ³  Gr”áe
 ÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍ
  Shortint ³       -128..127        ³  8 Bit
  Integer  ³     -32768..32767      ³ 16 Bit
  Longint  ³-2147483648..2147483647 ³ 32 Bit
  Byte     ³          0..255        ³  8 Bit
  Word     ³          0..65535      ³ 16 Bit

Alle Integertypen sind ordinal.

 ÜÜÜÜÜÜÜÜÜ
  Boolean
 ßßßßßßßßß
Variablen vom Typ Boolean k”nnen
ausschlieálich einen der vordefinierten Werte
False oder True annehmen. Tats„chlich handelt
es sich bei Boolean um einen Aufz„hlungstyp,
der folgendermaáen deklariert ist:

type
  Boolean = (False, True);

Die Anwendung der Operatoren
   =   <>   >   <   >=   <=   IN
innerhalb eines Ausdrucks erzeugt Ergebnisse
vom Typ Boolean.

 ÜÜÜÜÜÜ
  Char
 ßßßßßß
Variablen des ordinalen Typs Char werden
verwendet, um ASCII-Zeichen zu speichern.

Char-Konstanten werden mit Apostrophen
notiert, z.B.:

  'A', '3', or '*'

Das Apostroph selbst wird wie folgt
dargestellt:

  ''''

Der Aufruf der Funktion Ord(Ch), bei dem Ch
fr einen Wert vom Typ Char steht, liefert die
Ordinalzahl des Zeichens in Ch zurck; die
Funktion Chr liefert ein Zeichen des Typs Char
mit dem angegebenen ASCII-Code.

 ÜÜÜÜÜ
  Val     Prozedur
 ßßßßß
Interpretiert die Zeichenfolge des Strings s
als numerischen Wert und speichert das
Ergebnis in der als v bergebenen Variablen,
die vom Typ Integer oder Real ist.

Syntax:
  Val(s: string; var v; var code: Integer);

"code" enth„lt nach fehlerfreier Ausfhrung
den Wert 0; ansonsten die Position des
Zeichens in s, das den Fehler verursacht hat.

Siehe auch:

 Str



 { Example for Val }

 var
   i, code: Integer;
 begin
   { Get text from command line }
   Val(ParamStr(1), i, code);
   { Error during conversion to Integer? }
   if code <> 0 then
     WriteLn('Error at position: ', code)
   else
     WriteLn('Value = ', i);
 end.



 ÜÜÜÜÜ
  Str     Prozedur
 ßßßßß
Konvertiert den als x bergebenen Wert in eine
Zeichenfolge und speichert das Ergebnis in der
als s bergebenen Stringvariablen.

Syntax:
  Str(x [: width [: decimals ]]; var s: string);

Die optionalen Parameter "width" und
"decimals" haben dieselbe Funktion wie bei
Write.

Siehe auch:

 Val      Write



 { Example for Str }

 function IntToStr(i: Longint): string;
 { Convert any Integer type to a string }
 var
   s: string[11];
 begin
   Str(i, s);
   IntToStr := s;
 end;
 begin
   WriteLn(IntToStr(-5322));
 end.





 Ü Realtypen
 ßßßßßßßßßßßß
Turbo Pascal bietet fnf vordefinierte Real-
Typen mit unterschiedlichen Rechenbereichen
und unterschiedlicher Genauigkeit:

                               Genauig
  Typ     ³    Wertebreich    ³ keit  ³Bytes
 ÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍØÍÍÍÍÍ
  real    ³  2.9e-39..1.7e38  ³ 11-12 ³  6
  single  ³  1.5e-45..3.4e38  ³  7-8  ³  4
  double  ³ 5.0e-324..1.7e308 ³ 15-16 ³  8
  extended³3.4e-4932..1.1e4932³ 19-20 ³ 10
  comp    ³  -9.2e18..9.2e18  ³ 19-20 ³  8
 ÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÏÍÍÍÍÍ

Hinweis: Comp ist ein 64-Bit Integer.

Turbo Pascal untersttzt zwei Arten der Code-
Erzeugung fr Fileákomma-Operationen:

 ş Software {$N-}, hier steht nur der Datentyp
   Real zur Verfgung
 ş 80x87 {$N+}, hier kann mit allen fnf Typen
   gearbeitet werden

Mit der $N Compiler Direktive kann zwischen
den beiden M”glichkeiten umgeschaltet werden.

Im Modus {$N+} legt der Compiler-Befehl $E
fest, ob das Programm direkte Anweisungen fr
den Coprozessor enth„lt ({$E-}) oder ob eine
Bibliothek eingebunden wird, die den 8087 auf
Systemen ohne Coprozessor emuliert {$E+}.

 ÜÜÜÜÜ
  Ord     Funktion
 ßßßßß
Liefert die Ordinalzahl des Arguments zurck.

Syntax:
  Ord(x): Longint;

Siehe auch:

 Chr



 { Example for Ord }

 type
   Colors = (RED,BLUE,GREEN);
 begin
   WriteLn('BLUE has an ordinal value of ',
           Ord(BLUE));
   WriteLn('The ASCII code for "c" is ',
           Ord('c'), ' decimal');
 end.




  ÜÜÜÜÜ
  Chr     Funktion
 ßßßßß
liefert das Zeichen, dessen ASCII-Code dem
Wert von x entspricht.

Syntax:
  Chr(x: Byte): Char;

Siehe auch:

 Ord



 { Example for Chr }

 uses Printer;
 begin
   { Send form feed to printer }
   WriteLn(Lst, Chr(12));
 end.



