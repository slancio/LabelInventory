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
#

class Track < ActiveRecord::Base
  validates :name, presence: true
  validates :standard_or_bonus, inclusion: { in: %w(standard bonus) }

  belongs_to :album, dependent: :destroy
end
