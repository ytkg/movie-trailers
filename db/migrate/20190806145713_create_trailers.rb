class CreateTrailers < ActiveRecord::Migration[5.1]
  def change
    create_table :trailers, id: false do |t|
      t.string :id, primary_key: true
      t.integer :movie_id
      t.string :channel_id
      t.string :title
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
