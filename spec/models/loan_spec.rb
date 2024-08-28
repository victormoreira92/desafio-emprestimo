require 'rails_helper'

RSpec.describe Loan, type: :model do
  let(:loan) { build(:loan) }

  context 'is valid' do
    it 'with valid attributes' do
      expect(loan).to be_valid
    end
  end

  context 'is invalid' do
    it 'without customer' do
      loan.customer = nil
      expect(loan).not_to be_valid
    end
  end
end
