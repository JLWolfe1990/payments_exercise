class PaymentsController < ApplicationController
  def create
    @payment = Payment.create(create_params)

    if @payment.persisted?
      render json: @payment, status: :created
    else
      render json: @payment.errors, status: :bad_request
    end

  end

  def index
    @payments = Payment.all
    @payments = Payment.where(loan_id: params[:loan_id]) if params[:loan_id]

    render json: @payments.map(&:as_json)
  end

  def show
    render json: Payment.find(params[:id])
  end

  private

  def create_params
    params.permit(:transacted_on, :amount, :loan_id)
  end
end
