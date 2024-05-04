# language: pt
# encoding: utf-8

Before('@ExecuteBefore') do
  # Configurando o Json Schema.
  schema_directory = "#{Dir.pwd}/features/specifications/estabelecimento/resources/"
  # pego o camino do json e schema e chamo no meu teste o nome do arquivo.
  JsonMatchers.schema_root = schema_directory
end

Dado('que eu faça um GET no endpoint de consulta no portal VR') do
  Http.headers 'cookie' => $COOKIES
  @get_clientes = Http.get '/api-web/comum/enumerations/VRPAT'
end

Dado('que eu faça um GET no endpoint de comum no portal VR') do
  Http.headers 'cookie' => $COOKIES
  @get_body = Http.get '/api-web/comum/'
end

Quando('seleciono um estabelecimento aleatoriamente') do
  p @establishment = @get_clientes.parsed_response['typeOfEstablishment'].sample
  p @establishment["name"]
end

Quando('seleciono o primeiro estabelecimento') do
  p @establishment = @get_clientes.parsed_response['typeOfEstablishment'].first
end

Entao('valido o json schema do estabelecimento') do
  expect(@get_clientes.code).to eq 200
  expect(@get_clientes.body).to match_json_schema('establishment')
end

Entao('valido os dados do primeiro estabelecimento') do
  expect(@get_clientes.code).to eq 200
  expect(@establishment['key']).to eq("REFEICAO|PIZZARIA")
  expect(@establishment['name']).to eq("PIZZARIA")
  expect(@establishment['label']).to eq("Refeição - Pizzaria")
end

Entao('valido o acesso negado ao end point de comum') do
  expect(@get_body.code).to eq 401
  expect(@get_body.body).to eq("\"ACCESS_DENIED\"")
end
