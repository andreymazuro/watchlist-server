class UsersToMovie < ApplicationRecord
  validates_uniqueness_of :movie_id, :scope => [:user_id]
  belongs_to :movie
  belongs_to :user
end
