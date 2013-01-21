class PartyProfile < ActiveRecord::Base
  attr_accessible :date, :host, :location, :name, :password, :party_id, :songs

  validates_presence_of :name, :location, :date, :password

  has_many :songs
  has_many :guests


end
