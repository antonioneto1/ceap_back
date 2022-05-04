class ImporteCsvController < ApplicationController
  skip_before_action :verify_authenticity_token

  def importe_deputados
    if params[:file_csv].present?
      file = params[:file_csv].tempfile.path
      leitura_csv(file)
    else
      return render :json => {message: "deu erro"}, status: 400
    end
  end

  def leitura_csv(file)
    errors = []
    response = []
    cnpjs = []
    status = 200
    File.open(file).each do |r|
      r = r.join(",") if r.is_a?(Array)
      r = r.split(";")
      next if r[5] == "\"sgUF\"" || r[5] == "\"NA\""
      if r[5].present? && r[5] == "\"CE\""
        byebug
        dados = {
          nomeParlamentar: JSON.parse(r[0]),
          cpf: JSON.parse(r[1]),
          idDeputado: JSON.parse(r[2]),
          numeroCarteiraParlamentar: JSON.parse(r[3]),
          legislatura: JSON.parse(r[4]),
          siglaUF: JSON.parse(r[5]),
          siglaPartido: JSON.parse(r[6]),
          codigoLegislatura: JSON.parse(r[7]),
          numeroDeputadoID: JSON.parse(r[28]),

          fornecedor: JSON.parse(r[12]),
          cnpjCPF: JSON.parse(r[13]) ,
          numero: JSON.parse(r[14]),
          tipoDocumento: JSON.parse(r[15]),
          dataEmissao: JSON.parse(r[16]),
          valorDocumento: JSON.parse(r[17]),
          valorGlosa: JSON.parse(r[18]),
          valorLiquido: JSON.parse(r[19]),
          mes: JSON.parse(r[20]),
          ano: JSON.parse(r[21]),
          idDocumento: JSON.parse(r[29]),
          urlDocumento: JSON.parse(r[30])
          ressarcimento: (r[26] == "\"\"" ? '0' : JSON.parse(r[26])),
          restituicao: (r[27] == "\"\"" ? '0' : JSON.parse(r[27])),
        }
        byebug
        ceape = Ceape.create(dados)
      end
    end
  end
end