class Game < ApplicationRecord
  # Validations
  validates :name, uniqueness: true, presence: true
  validates :release_date, allow_blank: true, comparison: { less_than: Time.zone.now }
  validates :rating, allow_blank: true,
                     numericality: { in: 0..100, message: "Should be between 0 and 100" }
  validate :parent, :child
  # validate :valid_rating

  # Associations
  has_and_belongs_to_many :platforms
  has_and_belongs_to_many :genres
  belongs_to :parent, class_name: "Game", optional: true
  has_many :involved_companies, dependent: :destroy
  has_many :companies, through: :involved_companies
  has_many :critics, as: :criticable, dependent: :destroy
  has_many :expansions, class_name: "Game", foreign_key: "parent_id",
                        dependent: :destroy, inverse_of: "parent"
  enum category: { main_game: 0, expansion: 1 }
  has_one_attached :cover

  has_many :received_critics, class_name: "Critic", as: :criticable, dependent: :destroy

  private

  def parent
    return unless category == "main_game" && !parent_id.nil?

    errors.add(:parent_id, "must be blank. Select no parent game")
  end

  def child
    return unless category == "expansion" && parent_id.nil?

    errors.add(:parent_id, "must not be blank. Select parent game")
  end

  # def valid_rating
  #   return if !rating.nil? && rating.between?(0, 100)

  #   errors.add(:rating, "Should be between 0 and 100")
  # end
end
