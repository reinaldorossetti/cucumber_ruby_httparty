#language: pt

@get
Funcionalidade: Prova VR

@consulta
Cenario: consultas no portal VR
  Dado que eu faça um GET no endpoint de consulta no portal VR
  Quando seleciono um estabelecimento aleatoriamente
  Entao valido o json schema do estabelecimento

@primeiro_estabelecimento
Cenario: consulta o primeiro estabelecimento no portal VR
  Dado que eu faça um GET no endpoint de consulta no portal VR
  Quando seleciono o primeiro estabelecimento
  Entao valido os dados do primeiro estabelecimento

@cenario_negativo
Cenario: teste negativo acesso negado ao end point de comum
  Dado que eu faça um GET no endpoint de comum no portal VR
  Entao valido o acesso negado ao end point de comum

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