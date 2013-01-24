class ChangeDataTypeForDate < ActiveRecord::Migration
  def change
  	change_column :party_profiles, :date, :date
  end
end
