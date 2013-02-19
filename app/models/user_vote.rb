class UserVote < ActiveRecord::Base
  attr_accessible :party_profile_id, :soundcloud_id, :total_votes, :user_id
end
