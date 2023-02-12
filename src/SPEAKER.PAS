

Uses Crt;

const SPEAKER_PORT = $61;

var portval : byte;

begin

  portval := Port[SPEAKER_PORT] and $FC;

  while not KeyPressed do
    begin
      Port[SPEAKER_PORT] := portval or 2;
      Delay(5);
      Port[SPEAKER_PORT] := portval;
      Delay(5);
    end;
end.
