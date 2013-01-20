class Guest < ActiveRecord::Base
  attr_accessible :party_profile_id, :user_id
end
