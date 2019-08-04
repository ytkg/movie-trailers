namespace :movie do
  task fetch: :environment do
    require 'open-uri'

    event_file = open('https://eiga.com/movie/coming.ics').read
    
    events = Icalendar::Event.parse(event_file)
    events.each do |event|
      movie = Movie.find_or_initialize_by(title: event.summary.to_s)
      movie.publish_date = event.dtstart.to_date
      movie.description = event.description.to_s
      movie.save
    end
  end
end
