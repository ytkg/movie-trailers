class Movie < ApplicationRecord
  has_many :trailers, dependent: :delete_all
end
