# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  live_or_studio :string           not null
#  created_at     :datetime
#  updated_at     :datetime
#

class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :live_or_studio, inclusion: { in: %w(live studio) }

  belongs_to :band, dependent: :destroy
  has_many :tracks
end
