require 'rails_helper'

RSpec.describe Api::CustomerLoansController, type: :request do
  describe 'POST /api/customer_loans' do
    context 'when success' do
      it 'creates a customer loan' do
        params = {
            name: Faker.name,
            cpf: Faker::Alphanumeric.alphanumeric(number: 11, min_numeric: 11),
            age: Faker::Number.between(from: 15, to: 50),
            income:  Faker::Number.between(from:1200, to: 10000),
            location: 'SP'
        }

        post api_customer_loans_path, params: params

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
