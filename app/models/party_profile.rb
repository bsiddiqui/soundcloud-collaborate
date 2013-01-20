class PartyProfile < ActiveRecord::Base
  attr_accessible :date, :host, :location, :name, :password
end
