class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true
  validates_associated :cocktail
  validates :rating, inclusion: { in: 1..5 }, numericality: true
end
