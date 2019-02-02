namespace :channel do
  task :add, [:channel_id] => :environment do |_, args|
    require 'google/apis/youtube_v3'

    client = Google::Apis::YoutubeV3::YouTubeService.new
    client.key = ENV['GOOGLE_API_KEY']

    channel_id = args.channel_id
    channels_result = client.list_channels(:snippet, id: channel_id)
    if channels_result.items.blank?
      puts 'Channel Not Found'
      exit
    end

    snippet = channels_result.items.first.snippet

    channel = Channel.find_or_initialize_by(id: channel_id)
    channel.title = snippet.title
    channel.description = snippet.description
    channel.thumbnail_url = snippet.thumbnails.high.url
    channel.save
  end
end
