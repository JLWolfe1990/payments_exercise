require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:loan) { Loan.create!(amount: -100.00, transacted_on: Date.today) }

  describe '#create' do
    let(:amount) { 1.01 }
    let(:transacted_on) { Date.today }

    let(:create_params) do
      { amount: amount, transacted_on: transacted_on, loan_id: loan.id }
    end

    context 'with valid params' do
      subject do
        post :create, params: create_params, format: :json
      end

      it 'successfully creates a payment' do
        expect { subject }.to change { Payment.count }.by(1)
      end

      it 'returns 201 created' do
        subject

        expect(response).to be_created
      end
    end

    context 'with invalid params' do
      subject do
        post :create, params: create_params.merge(transacted_on: nil), format: :json
      end

      it 'returns the errors hash' do
        subject

        expected_json = { 'transacted_on' => ["can't be blank"] }
        expect(JSON.parse(response.body)).to eq(expected_json)
      end
    end
  end

  describe '#show' do
    let(:payment) { Payment.create(amount: 1.01, transacted_on: Date.today, loan_id: loan.id) }

    subject do
      get :show, params: { id: payment.id }, format: :json
    end

    it 'should return the balance' do
      subject
      expect(response).to be_successful
    end
  end
end
