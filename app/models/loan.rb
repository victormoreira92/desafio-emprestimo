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
