# language: pt
# encoding: utf-8

@backend
Funcionalidade: Feature de Filtro por Marcador.

@cenario01
Cenario: bananas e tomates 
  Dado a string de entrada "bananas, tomates # e ventiladores"
  E os marcadores:
  | #          |
  | !          |
  Então a saída esperada é: "bananas, tomates"

@cenario02
Cenario: o rato roeu a roupa
  Dado a string de entrada "o rato roeu a roupa $ do rei % de roma"
  E os marcadores:
  | %          |
  | !          |
  Então a saída esperada é: "o rato roeu a roupa $ do rei"

@cenario03
Cenario: the quick brown fox
  Dado a string de entrada "the quick brown fox & jumped over * the lazy dog"
  E os marcadores:
  | &          |
  | *          |
  | %          |
  | !          |
  Então a saída esperada é: "the quick brown fox"