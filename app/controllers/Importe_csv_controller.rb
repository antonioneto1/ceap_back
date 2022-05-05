class ImporteCsvController < ApplicationController
  skip_before_action :verify_authenticity_token
  require 'csv'

  def importe_deputados
    if params[:file_csv].present?
      file = params[:file_csv].tempfile.path
      Thread.new do
        ceap = Ceap.new(ceap_params)
        deputados = leitura_csv(file)
        if deputados.present?
          deputados.each do |deputado|
            ceap.deputados << deputado
          end
          ceap.save
        end
      end
      format.html { redirect_to ceaps_url, notice: "O Seu arqivo está sendo importado, embreve voce podera ver-lo" }
      format.json { head :no_content }
    else
      return render :json => {message: "O arquvi precisa está presente"}, status: 400
    end
  end

  def leitura_csv(file)
    deputados_ids = []
    File.open(file).each do |r|
      r = r.join(",") if r.is_a?(Array)
      r = r.split(";")
      next if r[5] == "\"sgUF\"" || !r[5] == "\"CE\""
      deputado = Deputado.where(cpf: JSON.parse(r[1]), idDeputado: JSON.parse(r[2])).first
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
        depu = Deputado.new(dados_deputado)
        depu.id = depu.idDeputado
        depu.save
        deputados << depu
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
        Despesa.create(dados_despesa)
      end
    end
    return deputados
  end
end