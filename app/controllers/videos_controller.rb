class VideosController < ApplicationController
  before_filter :find_video, only: [:show, :edit, :update]

  def index
    @videos = Video.all
  end

  def show
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to videos_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @video.update_attributes(video_params)
      redirect_to videos_path
    else
      render :edit
    end
  end

  def destroy
    if @video.destroy
      redirect_to videos_path
    else
      redirect_to @video
    end
  end

  private

  def find_video
    @video = Video.find(params[:id])
    unless @video
      flash[:error] = "Unable to locate the Video"
      redirect_to :back and return
    end
  end

  def video_params
    params.require(:video).permit(:url, :name)
  end

end
