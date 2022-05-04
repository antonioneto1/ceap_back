class CeapsController < ApplicationController
  before_action :set_ceap, only: %i[ show edit update destroy ]

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

  # GET /ceaps/1/edit
  def edit
  end

  # POST /ceaps or /ceaps.json
  def create
    @ceap = Ceap.new(ceap_params)

    respond_to do |format|
      if @ceap.save
        format.html { redirect_to ceap_url(@ceap), notice: "Ceap was successfully created." }
        format.json { render :show, status: :created, location: @ceap }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ceap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ceaps/1 or /ceaps/1.json
  def update
    respond_to do |format|
      if @ceap.update(ceap_params)
        format.html { redirect_to ceap_url(@ceap), notice: "Ceap was successfully updated." }
        format.json { render :show, status: :ok, location: @ceap }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ceap.errors, status: :unprocessable_entity }
      end
    end
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

    # Only allow a list of trusted parameters through.
    def ceap_params
      params.require(:ceap).permit(:deputados_ids, :exercicio, :total_gastos)
    end
end
