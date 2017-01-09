class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :poster_path
      t.string :vote_average
      t.string :first_air_date
      t.integer :movie_id

      t.timestamps
    end
  end
end
