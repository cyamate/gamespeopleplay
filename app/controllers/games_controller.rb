class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /games
  # GET /games.json
  def index
    @games = Game.order("#{sort_column} #{sort_direction}").page(params[:page]).per(20)
    @most = Game.most
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @scores = Log.joins(:player_scores).where(game_id: @game.id).pluck(:score, :pcount)
    @logshistory = Log.where(game_id: @game.id).group_by_month(:date, last: 12).count.sort
  end

  # GET /games/new
  def new
    @game = Game.new
    2.times { game_designer = @game.game_designers.build }
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
    1.times { game_designer = @game.game_designers.build }
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def sortable_columns
      ["name", "pcount", "year", "owned"]
    end

    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(
        :name, :pcount, :year, :owned, :publisher_id, 
        game_designers_attributes: [:id, :game_id, :designer_id, :_destroy])
    end
end
