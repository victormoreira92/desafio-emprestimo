module Api
  class CustomersController < ApplicationController

    # POST /customers
    def create
      @customer = Customer.new(customer_params)

      if @customer.save
        render json: { customer: @customer.name,
                       loans: @customer.loans.map { |loan| loan_attributes(loan) } }, status: :created
      else
        render json: { error: @customer.errors }, status: :unprocessable_entity
      end
    end
    
    private

      def customer_params
        params.require(:customer).permit(:age, :name, :cpf, :income, :location)
      end

      def loan_attributes(loan)
        {
          type: loan.type_loan.upcase,
          interest_rate: loan.interest_rate
        }
      end
  end
end
