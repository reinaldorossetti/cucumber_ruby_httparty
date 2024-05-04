# Projeto usando o Httparty e Cucumber.  

A configuração (importe das gems) está dentro do **suport/env.rb** e a instância do Httparty está dentro do módulo Http, e depois adicionando no cucumber com o World(Http), assim posso mudar a base_uri para chamar diversos end point/micro serviços.

# PASSO A PASSO  

**Pré-requisitos:**  
Instalação do Ruby com DevKit (versão instalada 3.0.7):  
Windows:  
https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.0.7-1/rubyinstaller-devkit-3.0.7-1-x64.exe  
Linux:  
https://www.ruby-lang.org/en/news/2024/04/23/ruby-3-0-7-released/  

** Configurar a variável de ambiente conforme o sistema operacional.

**1 - Faça um clone no projeto no seu PC.**

git clone https://github.com/reinaldorossetti/cucumber_ruby_httparty.git

**2 - Passo de entre na pasta do projeto**
```
cd cucumber_ruby_httparty
```
**3 - Passo instale as dependências**
```
bundle install
```
** Precisa instalar a gem, comando "gem install bundle", sem aspas duplas.

**4- Passo rode o nosso projeto, abrar o terminal em tests e envie o comando abaixo:**

```
bundle exec cucumber --publish 
bundle exec cucumber features/backend_tests.feature
bundle exec cucumber --tags @backend
```
Para visualizar o relatório gerado do allure report, segue o link abaixo:
```
https://reinaldorossetti.github.io/cucumber_ruby_httparty/allure-report/
```
Para adiciona compatibilidade com linux x86 e x64
```
bundle lock --add-platform x86_64-linux
```
Rodar local com report do cucumber.
```
bundle exec cucumber --format html --out=report/report.html
```

### Estrutura de diretórios
Estou seguindo o padrão official do cucumber, com a pasta principal features e a de configurações support.
Optei para uma configuração descentralizada, cada squad conseguiria mexer de forma isolada na sua estrutura.

```
cucumber_ruby_httparty/  
 ├─ .github                     - Pasta padrão do Git Actions, contém a pipeline de testes.
 ├─ features/                   - Pasta pricipal do Cucumber.
 |   ├─ specifications /
 |      ├─ nome_da_feature /    - Pasta com o nome da funcionalidade que será automatizada.
 |          ├─ resources        - Arquivos diversos que fazem parte dos testes.
 |          ├─ step_definitions - Pasta que contém o passo a passo das chamadas dos testes (padronizado _steps.rb).
 |          └─ *_tests.feature  - Arquivo .feature que contém a descrição dos testes (padronizado _tests.feature).  
 |   └─ support/                - Arquivos Globais de Configuração ou Setup dos testes usando o framework do Cucumber.  
 |       ├─ resources           - Arquivos de Recursos Globais. 
 |       ├─ httparty_config.rb  - Adicionado um modulo pra configurar o httparty, assim posso chamar diversos micro-serviços.
 |       └─ env.rb              - Arquivo de Configuração do Cucumber.  
 ├─ .gitignore 
 ├─ cucumber.yml                - Arquivo Configuração da Execução do Cucumber.
 ├─ Gemfile                     - Bibliotecas que foram usadas no projeto.
 └─ README.md                   - Documentação basica de configuração e execução do Projeto.
```

Referências:  
https://github.com/ruby-json-schema/json-schema/tree/master  
https://github.com/jnunemaker/httparty  
