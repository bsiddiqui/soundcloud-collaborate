class PartyProfile < ActiveRecord::Base
  attr_accessible :date, :host, :location, :name, :password, :party_id, :songs

  validates_presence_of :name, :location, :date, :host

  has_many :songs
  has_and_belongs_to_many :users, :join_table => 'guests'

end
