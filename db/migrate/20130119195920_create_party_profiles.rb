class CreatePartyProfiles < ActiveRecord::Migration
  def change
    create_table :party_profiles do |t|
      t.string :name
      t.string :password
      t.string :location
      t.datetime :date
      t.string :host

      t.timestamps
    end
  end
end
