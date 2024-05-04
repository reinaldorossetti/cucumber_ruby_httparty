require 'rspec'
require 'cucumber'
require 'httparty'
require 'faker'
require 'cpf_faker'
require 'json'
require "json_matchers/rspec"
require "allure-cucumber"
require_relative 'httparty_config.rb'

# pegado os cookies.
COOKIE_FILE = "#{Dir.pwd}/features/support/resources/cookie.json"
$COOKIES = (JSON.parse(open(COOKIE_FILE).read))['cookies'].to_s

# Colocando o Httparty como um modulo global no Cucumber.
# Pode ser adicionado um modulo helper para ajuda com funções globais, em um projeto maior.
World(Http)
