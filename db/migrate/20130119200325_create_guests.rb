class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :user_id
      t.string :party_profile_id

      t.timestamps
    end
  end
end
