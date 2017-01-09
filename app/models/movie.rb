class Movie < ApplicationRecord
  has_many :users_to_movies
  has_many :users, through: :users_to_movies
end
