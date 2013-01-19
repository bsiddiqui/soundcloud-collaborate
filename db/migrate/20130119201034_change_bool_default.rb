class ChangeBoolDefault < ActiveRecord::Migration
  def change
  	 change_column :songs, :played, :boolean, :default => false
  end
end
