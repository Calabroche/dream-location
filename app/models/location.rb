class Location < ApplicationRecord
  belongs_to :user
  belongs_to :dream
  validates :name, :starts_at, :ends_at, presence: :true
end
