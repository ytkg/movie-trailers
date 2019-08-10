class HomeController < ApplicationController
  def index
    @video_ids = Trailer.joins(:movie).where('publish_date >= ?', 1.month.ago).ids.shuffle
  end
end
