
class Customer < ApplicationRecord
  has_many :loans
  after_create :create_loans

  validates :name,:age,:cpf, :income, :location, presence: true
  #validates :cpf, uniqueness: true
  validates :cpf, format: { with: /\A\d{11}\z/ }

  private
  def create_loans
    if self.income <= 3000
      Loan.create(customer_id: self.id, type_loan: :personal)
      Loan.create(customer_id: self.id, type_loan: :guaranteed)
    end

    if self.income >= 5000
      Loan.create(customer_id: self.id, type_loan: :consignment)
    end

    if self.location.eql?('SP') || self.age < 30
      Loan.create(customer_id: self.id, type_loan: :guaranteed) unless self.loans.pluck(:type_loan).include?('guaranteed')
      Loan.create(customer_id: self.id, type_loan: :personal) unless self.loans.pluck(:type_loan).include?('personal')
    end

  end
end
