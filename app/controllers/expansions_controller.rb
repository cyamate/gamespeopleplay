class ExpansionsController < ApplicationController
  before_action :set_expansion, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /expansions
  # GET /expansions.json
  def index
    @expansions = Expansion.order("#{sort_column} #{sort_direction}").page(params[:page]).per(20)
  end

  # GET /expansions/1
  # GET /expansions/1.json
  def show
  end

  # GET /expansions/new
  def new
    @expansion = Expansion.new
    2.times { expansion_designer = @expansion.expansion_designers.build }
  end

  # GET /expansions/1/edit
  def edit
    @expansion = Expansion.find(params[:id])
    1.times { expansion_designer = @expansion.expansion_designers.build }
  end

  # POST /expansions
  # POST /expansions.json
  def create
    @expansion = Expansion.new(expansion_params)

    respond_to do |format|
      if @expansion.save
        format.html { redirect_to @expansion, notice: 'Expansion was successfully created.' }
        format.json { render :show, status: :created, location: @expansion }
      else
        format.html { render :new }
        format.json { render json: @expansion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expansions/1
  # PATCH/PUT /expansions/1.json
  def update
    respond_to do |format|
      if @expansion.update(expansion_params)
        format.html { redirect_to @expansion, notice: 'Expansion was successfully updated.' }
        format.json { render :show, status: :ok, location: @expansion }
      else
        format.html { render :edit }
        format.json { render json: @expansion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expansions/1
  # DELETE /expansions/1.json
  def destroy
    @expansion.destroy
    respond_to do |format|
      format.html { redirect_to expansions_url, notice: 'Expansion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def sortable_columns
      ["name", "pcount", "year", "owned", "game"]
    end

    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_expansion
      @expansion = Expansion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expansion_params
      params.require(:expansion).permit(
        :name, :pcount, :year, :owned, :publisher_id, :game_id, 
        expansion_designers_attributes: [:id, :expansion_id, :designer_id, :_destroy])
    end
end
