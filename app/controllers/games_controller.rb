class GamesController < ApplicationController
  before_action :set_game,
                only: %i[show edit update destroy add_platform add_genre delete_platform
                         delete_genre]

  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/1
  def show
    authorize @game
    all_critics = policy_scope(Critic)
    received_critics = @game.received_critics
    @game_critics = all_critics & received_critics
  end

  # GET /games/new
  def new
    @game = Game.new
    authorize @game
  end

  # GET /games/1/edit
  def edit
    authorize @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)
    authorize @game

    if @game.save
      redirect_to root_path, notice: "Game was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    authorize @game
    if @game.update(game_params)
      redirect_to root_path, notice: "Game was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def add_platform
    authorize @game, :update?
    @platform = Platform.find(params[:platform_id])
    # authorize @platform #################################
    @game.platforms << @platform
    redirect_to game_path(@game)
  end

  def delete_platform
    authorize @game, :update?
    @platform = Platform.find(params[:platform_id])
    # authorize @platform
    @game.platforms.delete(@platform)
    redirect_to game_path(@game), status: :see_other
  end

  def add_genre
    authorize @game, :update?
    @genre = Genre.find(params[:genre_id])
    # authorize @genre
    @game.genres << @genre
    redirect_to game_path(@game)
  end

  def delete_genre
    authorize @game, :update?
    @genre = Genre.find(params[:genre_id])
    # authorize @genre
    @game.genres.delete(@genre)
    redirect_to game_path(@game), status: :see_other
  end

  # DELETE /games/1
  def destroy
    authorize @game
    @game.destroy
    redirect_to games_url, notice: "Game was successfully destroyed.", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:name, :summary, :release_date, :category, :rating, :parent_id,
                                 :cover)
  end
end
