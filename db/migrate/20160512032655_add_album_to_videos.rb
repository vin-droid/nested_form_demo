class AddAlbumToVideos < ActiveRecord::Migration
  def change
    add_reference :videos, :album, index: true, foreign_key: true
  end
end
