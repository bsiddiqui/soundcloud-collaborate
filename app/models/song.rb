class Song < ActiveRecord::Base
  attr_accessible :artist, :downVotes, :length, :name, :party_profile_id, :played, :totalVotes, :upVotes, :user_id

  #validates_presence_of :party_profile_id, :name, :artist

  belongs_to :party_profile

end
