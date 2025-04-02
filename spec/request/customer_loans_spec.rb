require 'rails_helper'

RSpec.describe Api::CustomersController, type: :request do
  let!(:customer_params) { build(:customer) }

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

      context 'when customer has income <= 3000' do
        it 'customer has loan personal and guaranteed' do
          params = build(:customer, income: '2500')
          post api_customers_path, params: params
          %w[PERSONAL GUARANTEED].each do |type_loan|
            expect(JSON.parse(response.body)['loans'].pluck('type')).to include(type_loan)
          end
        end

      end

      context 'when customer has income >= 5000' do
        it 'customer has only CONSIGNMENT' do
          params = build(:customer, income: '5000')
          post api_customers_path, params: params
          expect(JSON.parse(response.body)['loans'].pluck('type')).to include('CONSIGNMENT')
        end

      end

      context 'when the customer has an income between 3000 and 5000, lives in São Paulo (SP),'\
              ' and is under 30 years old' do
        it 'customer has loan personal and guaranteed' do
          params = build(:customer, income: '3100.15', location: 'SP', age: 28)
          post api_customers_path, params: params
          %w[PERSONAL GUARANTEED].each do |type_loan|
            expect(JSON.parse(response.body)['loans'].pluck('type')).to include(type_loan)
          end
        end
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
          expect(JSON.parse(response.body)['error'][field]).to include("can't be blank")
        end
      end
    end
  end
end
