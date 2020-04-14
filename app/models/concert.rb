class Concert < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :band
  has_many :participations

  validates :price_cents, numericality: true

  has_one_attached :photo
end
