class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :uid, :image, :id
  
  validates_uniqueness_of :uid
  
  has_many :parties

end
