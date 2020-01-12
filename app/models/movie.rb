class Movie < ApplicationRecord
  has_many :trailers, dependent: :delete_all

  scope :active, -> { where('publish_date >= ?', 1.month.ago) }
end
