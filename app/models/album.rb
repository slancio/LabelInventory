# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  live_or_studio :string           not null
#  created_at     :datetime
#  updated_at     :datetime
#  band_id        :integer          not null
#

class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :live_or_studio, inclusion: { in: %w(live studio) }
  validates :band_id, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
