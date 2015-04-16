class NotesController < ApplicationController

  def create
    @note = Note.new(note_params)
    @note.track_id = params[:id]
    @note.user_id = current_user.user_id
    unless @note.save
      flash.now[:errors] = @note.errors.full_messages
    end
    redirect_to track_url(Track.find(@note.track[:id]))
  end

  def destroy
  end

  private

    def note_params
      params.require(:note).permit(:note_text, :track_id, :user_id)
    end
end
