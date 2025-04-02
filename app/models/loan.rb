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
class Loan < ApplicationRecord
  belongs_to :customer
  after_create :set_interest_rate

  enum type_loan: {
    personal: 0,
    guaranteed: 1,
    consignment: 3
  }

  private

  def set_interest_rate
    if self.personal?
      self.update(interest_rate: 4)
    end

    if self.guaranteed?
      self.update(interest_rate: 3)
    end

    if self.consignment?
      self.update(interest_rate: 2)
    end

  end

end
