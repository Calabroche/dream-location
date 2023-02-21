class Dream < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :locations, dependent: :destroy
  validates :name, :description, :regions, presence: :true
  validates :description, length: { in: 10..500}
  has_many_attached :images


  after_validation :geocode, if: :will_save_change_to_name_street?
  geocoded_by :address

  def address
    "#{number_street} #{name_street} #{post_code} #{city}"
  end

end
