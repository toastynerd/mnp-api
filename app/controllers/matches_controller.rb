class MatchesController < ApplicationController
  def index
    render json: Match.where(match_search_params)
  end

  private
  def match_search_params
    params.permit(:week, :home, :away, :venue, :date)
  end
end
