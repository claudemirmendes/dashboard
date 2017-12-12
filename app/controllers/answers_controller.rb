class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  def send_emails
    members = Member.all
    avaliation = Avaliation.last_not_finished
    avaliation.generate_average(avaliation[0].id)
    sender = Answer.send_emails(members,avaliation)
    avaliation.finished(avaliation[0].id)


    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Pesquisa enviada com sucesso' }
      format.json { head :no_content }
    end
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.create_average(answer_params)

    respond_to do |format|
      if @answer != nil
        format.html { redirect_to answers_url, notice: 'Nota atribuida com sucesso'}
        format.json { redirect_to answers_url,status: created, location: @answer}
      else
        format.html { render :new}
        format.json {render json: answers_url,status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:average, :avaliation_id)
    end
end
