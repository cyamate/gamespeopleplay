class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.all
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
    @logsbygame = Log.joins(:player_scores).where(game_id: @log.game).pluck(:score, :pcount)
    @logpoints = PlayerScore.joins(:log).where(log_id: @log.id).pluck(:score, :pcount)
    @sum = @logsbygame + @logpoints
  end

  # GET /logs/new
  def new
    @log = Log.new
    6.times { player_score = @log.player_scores.build }
    2.times { log_expansions = @log.log_expansions.build }
  end

  # GET /logs/1/edit
  def edit
    @log = Log.find(params[:id])
    1.times { player_score = @log.player_scores.build }
    1.times { log_expansions = @log.log_expansions.build }
  end

  # POST /logs
  # POST /logs.json
  def create
    @log = Log.new(log_params)

    respond_to do |format|
      if @log.save
        format.html { redirect_to @log, notice: 'Log was successfully created.' }
        format.json { render :show, status: :created, location: @log }
      else
        format.html { render :new }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to @log, notice: 'Log was successfully updated.' }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url, notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(
        :date, :game_id, :pcount, :game_id, :expansion_id, :comment,  
        player_scores_attributes: [:id, :log_id, :player_id, :score, :_destroy], 
        log_expansions_attributes: [:id, :expansion_id, :log_id, :_destroy])
    end
end
