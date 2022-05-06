class DeputadosController < ApplicationController
  before_action :set_deputado, only: %i[ show ]

  # GET /deputados or /deputados.json
  def index
    @deputados = Deputado.all
  end

  # GET /deputados/1 or /deputados/1.json
  def show
  end

  # GET /deputados/new
  def new
    @deputado = Deputado.new
  end

  # GET /deputados/1/edit
  def edit
  end

  # POST /deputados or /deputados.json
  def create
    @deputado = Deputado.new(deputado_params)

    respond_to do |format|
      if @deputado.save
        format.html { redirect_to deputado_url(@deputado), notice: "Deputado was successfully created." }
        format.json { render :show, status: :created, location: @deputado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deputado.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deputado
      @deputado = Deputado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deputado_params
      params.require(:deputado).permit(:nomeParlamentar, :cpf, :idDeputado, :numeroCarteiraParlamentar, :legislatura, :siglaUF, :siglaPartido, :codigoLegislatura, :numeroDeputadoID, :urlPhoto, :despesas_ids)
    end
end
