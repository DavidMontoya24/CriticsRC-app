class Genre < ApplicationRecord
  # Validations
  validates :name, uniqueness: true, presence: true
  # Associations
  has_and_belongs_to_many :games
end
