class User < ApplicationRecord
  validates :name,:email, uniqueness: true
  has_many :users_to_movies, dependent: :destroy
  has_many :movies, through: :users_to_movies

end
