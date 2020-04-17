class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :location
  after_validation :geocode, if: -> { will_save_change_to_location? && !skip_geocoding }

  attr_accessor :skip_geocoding

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one  :band
  has_many :participations
  has_many :concerts, through: :participations

  validates :first_name, :last_name, :location, presence: true
  validates :move_radius, numericality: { only_integer: true }

  has_one_attached :photo

  include AlgoliaSearch

  algoliasearch do
    geoloc :lat_attr, :lng_attr
  end
end
