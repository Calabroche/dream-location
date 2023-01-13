class Dream < ApplicationRecord
  belongs_to :user
  has_many :locations, dependent: :destroy
  validates :name, :description, :regions, presence: :true
  validates :description, length: { in: 10..500}
end
