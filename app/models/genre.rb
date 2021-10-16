class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
end
