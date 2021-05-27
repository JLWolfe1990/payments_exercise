require 'rails_helper'

RSpec.describe Payment do
  let(:loan) { Loan.create!(amount: -100.00, transacted_on: 1.day.ago)}
  let(:valid_params) do
    { transacted_on: Date.today, amount: 1.01, loan_id: loan.id }
  end

  describe 'validations' do
    it 'lint params' do
      expect(Payment.create!(valid_params)).to be_persisted
    end

    context 'payment_date' do
      it 'presence' do
        payment = Payment.create(valid_params.merge(transacted_on: nil))
        expect(payment.errors[:transacted_on]).to include("can't be blank")
      end

      it 'date range' do
        payment = Payment.create(valid_params.merge(transacted_on: Date.tomorrow))
        expect(payment.errors[:transacted_on]).to include("can't be in the future")
      end
    end

    context 'amount' do
      it 'can not persist if the amount is greater than the loan' do
        expect(Payment.create(valid_params.merge(amount: 100.01))).to_not be_persisted
      end
    end
  end

  describe 'serialization' do
    let(:loan) { Loan.create!(amount: -100.00, transacted_on: 1.day.ago) }
    let(:payment) { Payment.create!(amount: 1.01, transacted_on: Date.today, loan: loan) }

    it 'should have the correct fields' do
      json = payment.as_json

      expect(json.keys).to eq([:id, :amount, :transacted_on])
    end
  end
end