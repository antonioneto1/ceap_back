class CeapsController < ApplicationController
  before_action :set_ceap, only: %i[ show edit update destroy]
  before_action :set_deputados, only: %i[ show ]
  #skip_before_action :verify_authenticity_token

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
    if params[:file_csv].present? && ceap_params[:exercicio].present?
      ceap_params[:total_gastos] = 0
      @ceap = Ceap.new(ceap_params)
      @ceap.save(validate: false)
      file = params[:file_csv].tempfile.path
      LeituraCsvJob.perform_later(file, @ceap)
      redirect_to ceaps_path, notice: 'Seu arquivo está sendo lido em backdround, embreve voce poderar ver-lo'
    else
      redirect_to new_ceap_path, notice: 'O arquivo CSV e o E xercicio precisam está presentes'
    end
  end

  # DELETE /ceaps/1 or /ceaps/1.json
  def destroy
    DestroyExercicioJob.perform_later(@ceap)
    redirect_to ceaps_url, notice: 'O exercicio está sendo exluido em backgount.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ceap
      @ceap = Ceap.find(params[:id])
    end

    def set_deputados
      @ceap = Ceap.find(params[:id])
      @deputados = @ceap.deputados.sort_by(&:total).reverse
    end

    # Only allow a list of trusted parameters through.
    def ceap_params
      params.require(:ceap).permit(:exercicio, :total_gastos)
    end
end
