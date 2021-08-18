class PlayersController < ApplicationController
  def index
    render json: Player.where(player_search_params).to_a
  end

  private
  def player_search_params
    params.permit(:name, :team, :role)
  end
end
