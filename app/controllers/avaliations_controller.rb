class AvaliationsController < ApplicationController
  before_action :set_avaliation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /avaliations
  # GET /avaliations.json
  def index
    @avaliations = Avaliation.all
  end

  def send_email
    members = Member.all
    avaliation = Avaliation.last
    sender = Avaliation.send_emails(members,avaliation)
    respond_to do |format|
      format.html { redirect_to avaliations_url, notice: 'Pesquisa enviada com sucesso' }
      format.json { head :no_content }
    end
  end

  # GET /avaliations/1
  # GET /avaliations/1.json
  def show
  end

  # GET /avaliations/new
  def new
    @avaliation = Avaliation.new
  end

  # GET /avaliations/1/edit
  def edit
  end

  # POST /avaliations
  # POST /avaliations.json
  def create
    @avaliation = Avaliation.create_avaliation(avaliation_params,current_user)

    respond_to do |format|
      if @avaliation == nil
        format.html { render :new, notice: 'Somente pode ser criado avaliação quando terminada a anterior'}
      else
        format.html { redirect_to @avaliation, notice: 'Avaliation was successfully created.' }
        format.json { render :show, status: :created, location: @avaliation }
      end
    end
  end



  # PATCH/PUT /avaliations/1
  # PATCH/PUT /avaliations/1.json
  def update
    respond_to do |format|
      if @avaliation.update(avaliation_params)
        format.html { redirect_to @avaliation, notice: 'Avaliation was successfully updated.' }
        format.json { render :show, status: :ok, location: @avaliation }
      else
        format.html { render :edit }
        format.json { render json: @avaliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliations/1
  # DELETE /avaliations/1.json
  def destroy
    @avaliation.destroy
    respond_to do |format|
      format.html { redirect_to avaliations_url, notice: 'Avaliation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliation
      @avaliation = Avaliation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avaliation_params
      params.require(:avaliation).permit(:user_id, :description, :validade)
    end
end
