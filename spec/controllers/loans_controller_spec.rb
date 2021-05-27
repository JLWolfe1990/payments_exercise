require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  describe '#index' do
    it 'responds with a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    let(:payment) { Loan.create!(amount: -100.0, transacted_on: Date.today) }

    it 'responds with a 200' do
      get :show, params: { id: payment.id }
      expect(response).to have_http_status(:ok)
    end

    it 'should have the amount_due' do
      get :show, params: { id: payment.id }
      expect(JSON.parse(response.body).keys).to include('amount_due')
    end

    context 'if the loan is not found' do
      it 'responds with a 404' do
        get :show, params: { id: 10000 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
