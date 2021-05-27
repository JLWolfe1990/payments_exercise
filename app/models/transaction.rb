class Transaction < ActiveRecord::Base
  validates :amount, presence: true
  validates :transacted_on, presence: true
  validates :type, presence: true

  validate :transacted_on_cannot_be_in_the_future

  private

  def transacted_on_cannot_be_in_the_future
    if transacted_on.present? && transacted_on > Date.today
      errors.add(:transacted_on, "can't be in the future")
    end
  end
end