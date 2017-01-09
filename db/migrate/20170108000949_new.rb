class New < ActiveRecord::Migration[5.0]
  def change
      add_column :users_to_movies, :imdb_id, :integer
  end
end
