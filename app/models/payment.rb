class Payment < Transaction
  belongs_to :loan

  validates :amount, numericality: { greater_than: 0 }

  validate :amount_within_range

  def as_json(opts={})
    {
      id: id,
      amount: amount,
      transacted_on: transacted_on.to_s(:iso8601)
    }
  end

  private

  def amount_within_range
    unless loan && (loan.balance + amount).to_f <= 0.0
      errors.add(:amount, "can't be more than the amount_due")
    end
  end
end