class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :length
      t.string :upVotes
      t.string :downVotes
      t.string :totalVotes
      t.string :user_id
      t.string :party_profile_id
      t.boolean :played, :default => false

      t.timestamps
    end
  end
end
