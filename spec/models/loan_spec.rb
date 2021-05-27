require 'rails_helper'

RSpec.describe Loan do
  describe 'serialization' do
    let(:loan) { Loan.create!(amount: -100.00, transacted_on: 1.day.ago) }

    it 'should have the correct fields' do
      json = loan.as_json

      expect(json.keys).to eq([:id, :payments, :amount_due, :transacted_on])
    end
  end

  describe 'amount_due' do
    context 'when there is a loan' do
      let(:amount) { -100.00 }
      let(:loan) { Loan.create!(amount: amount, transacted_on: Date.today) }

      subject { loan.amount_due }

      it { expect(subject).to eq(100.00)}

      it 'calculates against payments' do
        Payment.create(amount: 99.99, loan: loan, transacted_on: Date.today)

        expect(subject).to eq(0.01)
      end
    end
  end
end