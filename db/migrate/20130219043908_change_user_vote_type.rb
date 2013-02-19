class ChangeUserVoteType < ActiveRecord::Migration
  def change
  	change_column :user_votes, :user_id, :string
  	change_column :user_votes, :party_profile_id, :string
  	change_column :user_votes, :soundcloud_id, :string

  end
end
