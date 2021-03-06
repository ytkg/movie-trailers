class TrailersController < ApplicationController
  def index
    render json: Trailer.select(:id, :movie_id, :title, :thumbnail_url)
  end

  def sample
    render json: Trailer.select(:id, :movie_id, :title, :thumbnail_url).sample
  end
end
