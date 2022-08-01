class Company < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: true
  validate :valid_start_date_min, :valid_start_date_max
  has_many :critics, as: :criticable, dependent: :destroy
  has_many :involved_companies, dependent: :destroy
  has_many :games, through: :involved_companies
  has_one_attached :cover

  has_many :received_critics, class_name: "Critic", as: :criticable, dependent: :destroy

  private

  def valid_start_date_min
    return unless !start_date.nil? && start_date > 5.years.ago

    errors.add(:start_date, "Rome was not created in a day")
  end

  def valid_start_date_max
    return unless !start_date.nil? && start_date < 50.years.ago

    errors.add(:start_date, "Too Old")
  end
end
