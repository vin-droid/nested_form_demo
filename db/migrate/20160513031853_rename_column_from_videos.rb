class RenameColumnFromVideos < ActiveRecord::Migration
  def change
  	        rename_column :videos, :video_file_file_name, :video_file_name
  	        rename_column :videos, :video_file_content_type, :video_content_type
  	        rename_column :videos, :video_file_file_size, :video_file_size
  	        rename_column :videos, :video_file_updated_at, :video_updated_at
  end
end