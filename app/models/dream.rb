class Dream < ApplicationRecord
  belongs_to :user
  has_many :locations, dependent: :destroy
  validates :name, :description, presence: :true
  validates :description, length: { in: 10..200}
end
