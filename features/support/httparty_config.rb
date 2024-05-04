# adiciono um modulo pra configurar o httparty, depois adiciono no cucumber para ser chamado nos steps.
# assim posso mudar a base_uri para chamar diversos end point.

module Http
  include HTTParty
  base_uri 'https://portal.vr.com.br/'
  format :json
  open_timeout 30
  follow_redirects false
  headers 'Content-Type' => 'application/json'
end
