require 'rails_helper'

RSpec.describe Transaction do
  it 'cannot be initialized' do
    expect(Transaction.create.errors[:type]).to include("can't be blank")
  end
end