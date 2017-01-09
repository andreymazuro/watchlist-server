class CreateUsersToMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :users_to_movies do |t|
      t.references :movie, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
