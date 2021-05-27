class Loan < Transaction
  has_many :payments, dependent: :destroy

  validates :amount, numericality: { less_than: 0 }

  # usually I would bring in a library for this
  def as_json(opts={})
    {
      id: id,
      payments: payment_ids,
      amount_due: amount_due,
      transacted_on: transacted_on.to_s(:iso8601)
    }
  end

  def balance
    (amount + payments.sum(:amount)).round(2)
  end

  def amount_due
    balance.abs
  end
end
