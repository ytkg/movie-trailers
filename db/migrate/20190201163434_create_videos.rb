class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos, id: false do |t|
      t.string :id, primary_key: true
      t.string :channel_id
      t.string :title
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
