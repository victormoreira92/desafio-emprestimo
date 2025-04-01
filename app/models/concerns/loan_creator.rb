module LoanCreator
  extend ActiveSupport::Concern

  included do
    after_create :create_loans
  end

  private

  def create_loans
    if income <= 3000
      Loan.create!(customer_id: id, type_loan: :personal)
      Loan.create!(customer_id: id, type_loan: :guaranteed)
    end

    Loan.create!(customer_id: id, type_loan: :consignment) if income >= 5000

    if location.eql?('SP') && age < 30 && income.between?(3000, 5000)
      Loan.create!(customer_id: id, type_loan: :guaranteed) unless loans.pluck(:type_loan).include?('guaranteed')
      Loan.create!(customer_id: id, type_loan: :personal) unless loans.pluck(:type_loan).include?('personal')
    end
  end
end
