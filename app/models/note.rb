# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  track_id   :integer          not null
#  note_text  :text             not null
#  created_at :datetime
#  updated_at :datetime
#

class Note < ActiveRecord::Base
  validates :user_id, presence: true
  validates :track_id, presence: true
  validates :note_text, presence: true

  belongs_to :user, dependent: :destroy
  belongs_to :track, dependent: :destroy
end
