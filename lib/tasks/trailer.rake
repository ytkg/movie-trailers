namespace :trailer do
  task fetch: :environment do
    require 'google/apis/youtube_v3'

    client = Google::Apis::YoutubeV3::YouTubeService.new
    client.key = ENV['GOOGLE_API_KEY']

    Movie.all.each do |movie|
      searches_result = client.list_searches(:snippet, q: "#{movie.title} 予告", type: 'video', max_results: 50)

      next if searches_result.items.blank?

      searches_result.items.each do |item|
        title = item.snippet.title

        next if title !~ /^映画[「『]#{movie.title}[」』].*(予告|特報)/

        trailer = movie.trailers.find_or_initialize_by(id: item.id.video_id)
        trailer.channel_id = item.snippet.channel_id
        trailer.title = title
        trailer.thumbnail_url = item.snippet.thumbnails.high.url
        trailer.save
      end
    end
  end
end
