class VenuesController < ApplicationController
  def index
    render json: Venue.where(venue_search_params)
  end

  private
  def venue_search_params
    params.permit(:key, :name)
  end
end
