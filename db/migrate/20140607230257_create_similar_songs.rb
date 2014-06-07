class CreateSimilarSongs < ActiveRecord::Migration
  def change
    create_table :similar_artists do |t|
      t.string :name
    end
  end
end
