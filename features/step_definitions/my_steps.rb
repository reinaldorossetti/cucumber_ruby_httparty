# language: pt
# encoding: utf-8

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
  expect(@establishment).to match_json_schema('establishment')
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

Dado("a string de entrada {string}") do |string|
  @text = string
end

Dado('os marcadores:') do |table|
  # Dado a string, faz um for via map de caracteres, e inclue até encontrar o valor de pausa.
  # a regra do include? é usando o array caracteres_a_remover.
  @caracteres_a_remover = table.raw.flatten
  @new_text = ""
  @text.chars.each { |char|
    if @caracteres_a_remover.include?(char)
      break
    else
      @new_text << char
    end
  }
  @new_text = @new_text.strip
end

Então("a saída esperada é: {string}") do |string|
  expect(@new_text).to eq(string)
end
