class CreateUserVotes < ActiveRecord::Migration
  def change
    create_table :user_votes do |t|
      t.integer :user_id
      t.integer :party_profile_id
      t.integer :soundcloud_id
      t.integer :total_votes, :default => 0

      t.timestamps
    end
  end
end
