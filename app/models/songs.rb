class Songs < ActiveRecord::Base
  attr_accessible :artist, :downVotes, :length, :name, :party_profile_id, :played, :totalVotes, :upVotes, :user_id
end
