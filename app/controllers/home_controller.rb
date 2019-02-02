class HomeController < ApplicationController
  def index
    @video_ids = Video.pluck(:id).shuffle
  end
end
