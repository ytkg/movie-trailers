class HomeController < ApplicationController
  def index
    @video_ids = Video.where('created_at >= ?', 3.month.ago).pluck(:id).shuffle
  end
end
