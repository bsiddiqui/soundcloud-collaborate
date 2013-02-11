class ChangeDataTypeForDate2 < ActiveRecord::Migration
  def change
  	change_column :party_profiles, :date, :string
  end
end
