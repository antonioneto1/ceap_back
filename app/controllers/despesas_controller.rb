class DespesasController < ApplicationController
  before_action :set_despesa, only: %i[ show  ]

  # GET /despesas or /despesas.json
  def index
    @despesas = Despesa.all
  end

  # GET /despesas/1 or /despesas/1.json
  def show
  end

  # GET /despesas/new
  def new
    @despesa = Despesa.new
  end

  # POST /despesas or /despesas.json
  def create
    @despesa = Despesa.new(despesa_params)
    respond_to do |format|
      if @despesa.save
        format.html { redirect_to despesa_url(@despesa), notice: "Despesa was successfully created." }
        format.json { render :show, status: :created, location: @despesa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_despesa
      @despesa = Despesa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def despesa_params
      params.require(:despesa).permit(:deputado_id, :fornecedor, :cnpjCPF, :numero, :tipoDocumento, :dataEmissao, :valorDocumento, :valorGlosa, :valorLiquido, :mes, :ano, :ressarcimento, :restituicao, :idDocumento, :urlDocumento)
    end
end
