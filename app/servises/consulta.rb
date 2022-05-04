class Consulta
  include HTTParty
  base_uri 'https://dadosabertos.camara.leg.br/api/v2/deputados?'
  format :json

  def initialize
    @options = {}
  end

  def idCadastro(id)
    @options = { query: { id: id},body: {name: "deputado"}.to_json, headers: { 'Content-Type' => 'application/json' }}
    self.class.get("/", @options)
  end
end