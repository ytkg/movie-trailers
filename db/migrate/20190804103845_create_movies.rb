class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :publish_date
      t.text :description

      t.timestamps
    end
  end
end
