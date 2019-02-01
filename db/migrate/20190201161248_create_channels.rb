class CreateChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :channels, id: false do |t|
      t.string :id, primary_key: true
      t.string :title
      t.text :description
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
