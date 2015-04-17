class TracksController < ApplicationController
  before_action :require_sign_in

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @track = Track.new
    render :new
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :update
    end
  end

  def destroy
    @track = Track.find(params[:id])
    album = @track.album
    @track.destroy
    redirect_to album_url(album)
  end

  private

    def track_params
      params.require(:track).permit(:name, :standard_or_bonus, :lyrics, :album_id)
    end
end
