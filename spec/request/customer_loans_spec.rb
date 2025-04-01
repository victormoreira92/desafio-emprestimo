require 'rails_helper'

RSpec.describe Api::CustomersController, type: :request do
  describe 'POST /api/customer_loans' do
    context 'when success' do
      it 'creates a customer loan with all fields' do
        params = {
          customer: {
            name: Faker.name,
            cpf: Faker::Alphanumeric.alphanumeric(number: 11, min_numeric: 11),
            age: Faker::Number.between(from: 15, to: 50),
            income:  Faker::Number.between(from:1200, to: 10000),
            location: 'SP'
          }
        }

        post api_customers_path, params: params

        expect(response).to have_http_status(:success)
      end
    end

    context 'when error' do
      %w[name cpf age income location].each do |field|
        it "fails without #{field} field" do
          params = {
            customer: {
              name: Faker.name,
              cpf: Faker::Alphanumeric.alphanumeric(number: 11, min_numeric: 11),
              age: Faker::Number.between(from: 15, to: 50),
              income:  Faker::Number.between(from:1200, to: 10000),
              location: 'SP'
            }
          }
          params[:customer][field.to_sym] = ''
          post api_customers_path, params: params

          expect(response).to have_http_status(:unprocessable_entity)
          expect(JSON.parse(response.body)[field]).to include("can't be blank")
        end
      end
    end
  end
end
