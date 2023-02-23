class Like < ApplicationRecord
  belongs_to :dream
  belongs_to :user
  validates :user_id, uniqueness: { scope: :dream_id }
end
