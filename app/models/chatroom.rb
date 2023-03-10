class Chatroom < ApplicationRecord
  has_many :messages

  validates :name, presence: true, uniqueness: true

  def name
    self[:name].presence || 'General'
  end

end
