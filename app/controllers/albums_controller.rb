class AlbumsController < ApplicationController
  before_action :require_sign_in

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    render :new
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def update
    @album = Album.update(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :update
    end
  end

  def destroy
    @album = Album.find(params[:id])
    band = @album.band
    @album.destroy
    redirect_to band_url(band)
  end

  private

    def album_params
      params.require(:album).permit(:name, :live_or_studio, :band_id)
    end

end
