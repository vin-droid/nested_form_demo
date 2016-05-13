class PostsController < InheritedResources::Base
before_action :find_params ,only:[:show,:update,:edit,:destroy]
#before_action :find_album ,only:[:show_photos ,:show_videos]

  def index
    @posts = Post.all
  end
  
  def show
  end
  
  def new
    @post = Post.new
      album = @post.build_album
      1.times { album.photos.build  }
      1.times { album.videos.build  }

  end
  
  def create
      @post = Post.new(post_params)

    if @post.save!

    	p "===============#{@post.id}============"
      flash[:notice] = "Successfully created post."
      redirect_to @post
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to @post
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_url
  end




def show_videos
  p "================= #{params.inspect} show videos calling=========="
    @videos = Video.where(album_id: params[:album_id])
end


def show_photos
  p "================= #{params.inspect}  show photos calling=========="
    @photos = Photo.where(album_id: params[:album_id])
end



  private

  def find_params
  	 @post = Post.find(params[:id])
  end

  def find_album
     
  end

    def post_params
      params.require(:post).permit(:title ,:album_attributes => [:id,:title,:_destroy,
        :photos_attributes => [:id,:image,:_destroy],:videos_attributes=>[:id,:video ,:_destroy]])
    end
end

