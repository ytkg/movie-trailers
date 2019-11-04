class MoviesController < ApplicationController
  def index
    render json: Movie.select(:id, :title, :publish_date, :description)
  end
end
