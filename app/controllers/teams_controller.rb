class TeamsController < ApplicationController
  def index
    render json: Team.where(team_search_params)
  end

  private
  def team_search_params
    params.permit(:key, :name)
  end
end
