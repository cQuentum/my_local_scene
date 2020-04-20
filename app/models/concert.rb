class EndDateAfterStart < ActiveModel::Validator
  def validate(record)
    if record.start_time >= record.end_time
      record.errors[:base] << "La date de fin doit être après la date de début"
    end
  end
end

class Concert < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: -> { will_save_change_to_address? && !skip_geocoding }

  attr_accessor :skip_geocoding

  belongs_to :band
  has_many :participations
  has_one_attached :photo

  validates :price_cents, numericality: true
  validates :title, :photo, :address, :description, :start_time, presence: :true
end

