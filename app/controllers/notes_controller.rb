class NotesController < ApplicationController
  before_action :require_sign_in

  def new
    @note = Note.new
    @note.track_id = params[:id]
    @note.user_id = current_user.user_id
    @note
  end

  def create
    @note = Note.new(note_params)
    @note.track_id = params[:track_id]
    @note.user_id = current_user.id
    unless @note.save
      flash.now[:errors] = @note.errors.full_messages
    end
    redirect_to track_url(Track.find(@note.track[:id]))
  end

  def destroy
    @note = Note.find(params[:id])
    unless current_user.id == @note.user_id
      render :forbidden
    else
      track = Track.find(@note.track_id)
      @note.destroy
      redirect_to track_url(track)
    end
  end

  private

    def note_params
      params.require(:note).permit(:note_text, :track_id, :user_id)
    end
end
