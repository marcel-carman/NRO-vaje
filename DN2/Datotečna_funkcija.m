(* ::Package:: *)

Datoteka[n_] := Module[{vKrogu, izvenKroga, x, y},
  vKrogu = {}; izvenKroga = {};
  x = RandomReal[{-1, 1}, n];
  y = RandomReal[{-1, 1}, n];
  For[i = 1, i <= n, i++,
    If[Sqrt[x[[i]]^2 + y[[i]]^2] < 1,
      AppendTo[vKrogu, {x[[i]], y[[i]]}],
      AppendTo[izvenKroga, {x[[i]], y[[i]]}]
    ]];{vKrogu, izvenKroga}]

areaPi[to\[CHacek]ke_, n_] := Module[{piAproks, napaka},
  piAproks = 4*Length[to\[CHacek]ke]/n;
  napaka = Abs[Pi - piAproks];
  {piAproks, napaka}]

