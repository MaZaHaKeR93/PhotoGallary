class PicturesController < ApplicationController
	before_action :fetch_picture, only: [:show, :destroy]

  def index
  	@pictures = Picture.paginate(:page => params[:page], :per_page => 20).order('updated_at DESC')
  end

  def show
  end

  def new
 		if user_signed_in?
			@picture = Picture.new
		else 
			redirect_to new_user_session_path
		end
  end

  def create
 		@picture = Picture.new(picture_params)
		if @picture.save
			redirect_to root_path, notice: "Picture has been added"
		else
			render 'new'
		end
  end

  def destroy
		@picture.destroy
		redirect_to root_path, notice: "Notice has been deleted"
  end

  def show_user_pictures
    @user = User.find(params[:id])
    @pictures = @user.pictures
  end

	private

	def fetch_picture		
		@picture = Picture.find(params[:id])
	end

  def picture_params
    params.require(:picture).permit(:title, :image, :user_id)
  end
end
