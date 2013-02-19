class Song < ActiveRecord::Base
  attr_accessible :artist, :downVotes, :length, :name, :party_profile_id, :played, :totalVotes, :upVotes, :user_id, :soundcloud_id

  belongs_to :party_profile

end
