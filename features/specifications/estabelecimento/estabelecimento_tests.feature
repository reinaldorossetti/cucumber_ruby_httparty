# language: pt
# encoding: utf-8

@backend
Funcionalidade: Feature de Estabelecimento.

@consulta @ExecuteBefore
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