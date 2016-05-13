class Video < ActiveRecord::Base
belongs_to :album
      has_attached_file :video, styles: {
        :medium => {
          :geometry => "640x480",
          :format => 'mp4'
        },
        :thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}
    }, :processors => [:transcoder]
    

 validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
end



