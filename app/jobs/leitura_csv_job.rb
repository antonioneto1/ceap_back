class LeituraCsvJob < ApplicationJob
  queue_as :default

  def perform(file, ceap, email)
    deputados = []
    errors = []
    File.open(file).each do |r|
      begin
        r = r.join(",") if r.is_a?(Array)
        r = r.split(";")

        next if r[5].nil? || (r[5] == "\"sgUF\"" || !r[5].include?("\"CE\""))
        deputado = Deputado.where(id: JSON.parse(r[2])).first
        unless deputado
          dados_deputado = {
            nomeParlamentar: JSON.parse(r[0]),
            cpf: JSON.parse(r[1]),
            idDeputado: JSON.parse(r[2]),
            numeroCarteiraParlamentar: JSON.parse(r[3]),
            legislatura: JSON.parse(r[4]),
            siglaUF: JSON.parse(r[5]),
            siglaPartido: JSON.parse(r[6]),
            codigoLegislatura: JSON.parse(r[7]),
            numeroDeputadoID: JSON.parse(r[28]),
            urlPhoto: "http://www.camara.leg.br/internet/deputado/bandep/#{JSON.parse(r[2])}.jpg"
          }
          deputado = Deputado.create(dados_deputado)
          deputado.id = deputado.idDeputado
          deputado.ceap = ceap
          deputado.save(validate: false)
          deputados << deputado
        end

        unless Despesa.where(idDocumento: JSON.parse(r[29]), deputado_id: JSON.parse(r[2])).first
          dados_despesa = {
            deputado: deputado,
            fornecedor: JSON.parse(r[12]),
            cnpjCPF: JSON.parse(r[13]),
            numero: JSON.parse(r[14]),
            tipoDocumento: JSON.parse(r[15]),
            dataEmissao: JSON.parse(r[16]),
            valorDocumento: JSON.parse(r[17]),
            valorGlosa: JSON.parse(r[18]),
            valorLiquido: JSON.parse(r[19]),
            mes: JSON.parse(r[20]),
            ano: JSON.parse(r[21]),
            ressarcimento: (r[26] == "\"\"" ? '0' : JSON.parse(r[26])),
            restituicao: (r[27] == "\"\"" ? '0' : JSON.parse(r[27])),
            idDocumento: JSON.parse(r[29]),
            urlDocumento: JSON.parse(r[30])
          }
          despesa = Despesa.create(dados_despesa)
          deputado.despesas << despesa
          deputado.save(validate: false)
        end
      rescue => error
        errors <<  error.message
      end  
    end
    if deputados.present?
      deputados.each do |deputado|
        ceap.deputados << deputado
      end
      ceap.total_gastos = ceap.total
      ceap.save(validate: false)
      ConclusaoJob.perform_now(email, errors)
    end
  end
end
