# == Schema Information
#
# Table name: tracks
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  standard_or_bonus :string           not null
#  lyrics            :text
#  created_at        :datetime
#  updated_at        :datetime
#  album_id          :integer          not null
#

class Track < ActiveRecord::Base
  validates :name, presence: true
  validates :standard_or_bonus, inclusion: { in: %w(standard bonus) }
  validates :album_id, presence: true

  belongs_to :album, dependent: :destroy
  has_many :notes
end
