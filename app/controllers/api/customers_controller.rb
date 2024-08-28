module Api
  class CustomersController < ApplicationController

    # POST /customers
    def create
      @customer = Customer.new(customer_params)

      if @customer.save
        render json: @customer.loans, status: :created
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end

    private

      def customer_params
        params.require(:customer).permit(:age, :name, :cpf, :income, :location)
      end
  end
end
