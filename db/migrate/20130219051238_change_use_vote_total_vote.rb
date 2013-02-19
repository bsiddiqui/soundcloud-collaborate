class ChangeUseVoteTotalVote < ActiveRecord::Migration
  def change
  	rename_column :user_votes, :total_votes, :totalVotes
  end
end
