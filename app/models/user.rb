class User < ApplicationRecord
  validates :name,:email, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  has_many :users_to_movies, dependent: :destroy
  has_many :movies, through: :users_to_movies

end
