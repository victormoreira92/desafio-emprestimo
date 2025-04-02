# == Schema Information
#
# Table name: loans
#
#  id            :bigint           not null, primary key
#  interest_rate :integer
#  type_loan     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  customer_id   :bigint           not null
#
# Indexes
#
#  index_loans_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
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
