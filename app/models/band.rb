class Band < ApplicationRecord
  belongs_to :user
  has_many :concerts

  validates :name, :genre, :description, presence: :true
  validates :name, uniqueness: :true
  validates :description, length: { minimum: 50 }

  has_one_attached :photo
end
