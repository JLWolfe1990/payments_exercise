loan = Loan.create!(amount: -100.0, transacted_on: 2.day.ago)
Payment.create!(amount: 0.97, transacted_on: Date.yesterday, loan: loan)
Payment.create!(amount: 1.00, transacted_on: Date.today, loan: loan)
