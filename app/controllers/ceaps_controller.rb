class CeapsController < ApplicationController
  before_action :set_ceap, only: %i[ show edit update destroy]
  before_action :set_deputados, only: %i[ show ]
  skip_before_action :verify_authenticity_token

  # GET /ceaps or /ceaps.json
  def index
    @ceaps = Ceap.all
  end

  # GET /ceaps/1 or /ceaps/1.json
  def show
  end

  # GET /ceaps/new
  def new
    @ceap = Ceap.new
  end

  # POST /ceaps or /ceaps.json
  def create
    @ceap = Ceap.new(ceap_params)
    if params[:file_csv].present?
      file = params[:file_csv].tempfile.path
      Thread.new do
        deputados = leitura_csv(file, @ceap)
        if deputados.present?
          deputados.each do |deputado|
            @ceap.deputados << deputado
            @ceap.total_gastos += deputado.despesas.sum(:valorLiquido).to_f.round(2)
          end
          @ceap.save(validate: false)
        end
      end
      format.html { redirect_to root_path, notice: "O Seu arquivo está sendo importado, embreve voce podera ver-lo" }
      format.json { head :no_content }
    else
      return render :json => {message: "O arquvi precisa está presente"}, status: 400
    end
  end

  def leitura_csv(file, ceap)
    deputados = []
    File.open(file).each do |r|
      r = r.join(",") if r.is_a?(Array)
      r = r.split(";")
      next if r[5] == "\"sgUF\"" || !r[5] == "\"CE\""
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
    end
    return deputados
  end

  # DELETE /ceaps/1 or /ceaps/1.json
  def destroy
    @ceap.destroy

    respond_to do |format|
      format.html { redirect_to ceaps_url, notice: "Ceap was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ceap
      @ceap = Ceap.find(params[:id])
    end

    def set_deputados
      @ceap = Ceap.find(params[:id])
      @deputados = @ceap.deputados
    end

    # Only allow a list of trusted parameters through.
    def ceap_params
      params.require(:ceap).permit(:deputados_ids, :exercicio, :total_gastos, :csv_file)
    end
end
