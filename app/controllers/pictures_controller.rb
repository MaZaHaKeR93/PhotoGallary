class PicturesController < ApplicationController
  def index
  	@pictures = Picture.paginate(:page => params[:page], :per_page => 20)
  end

  def new
  end

  def create
  end

  def destroy
  end
end
