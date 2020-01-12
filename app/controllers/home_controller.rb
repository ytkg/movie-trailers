class HomeController < ApplicationController
  def index
    @video_ids = Trailer.joins(:movie).merge(Movie.active).ids.shuffle
  end
end
