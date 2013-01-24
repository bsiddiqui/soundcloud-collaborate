class AddSoundcloudidColumnToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :soundcloud_id, :string
  end
end
