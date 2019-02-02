namespace :video do
  task fetch: :environment do
    require 'google/apis/youtube_v3'
    
    client = Google::Apis::YoutubeV3::YouTubeService.new
    client.key = ENV['GOOGLE_API_KEY']

    Channel.find_each do |channel|
      searches_result = client.list_searches(:snippet, channel_id: channel.id, type: 'video', order: :date, max_results: 50)
      next if searches_result.items.blank?
    
      searches_result.items.each do |item|
        title = item.snippet.title
        next if title !~ /^映画[『.*』|「.*」]/

        video = Video.find_or_initialize_by(id: item.id.video_id)
        video.channel_id =  item.snippet.channel_id
        video.title = title
        video.thumbnail_url = item.snippet.thumbnails.high.url
        video.save
      end
    end
  end
end
