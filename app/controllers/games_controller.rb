class GamesController < ApplicationController
  before_action :fetch_game, only: [:show]
  
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
    @players = Member.all
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      @game.update_participants_status
      redirect_to games_path
    else
      render :new
    end
  end

  def show
  end

  private

  def fetch_game
    @game = Game.find_by_uuid(params[:uuid])
  end

  def game_params
    params.require(:game).permit(participants_attributes: [:member_id, :score])
  end

end
