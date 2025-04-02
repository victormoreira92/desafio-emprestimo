# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  age        :integer
#  cpf        :string
#  income     :decimal(15, 2)
#  location   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

describe Customer, type: :model do
  let!(:customer) { create(:customer) }

  context 'is valid' do
    it 'all fields are filled' do
      expect { create(:customer) }.to change(described_class, :count).by(1)
    end
  end

  context 'is invalid' do
    context 'fields in blank' do
      it 'without name' do
        customer = build(:customer, name: nil)
        customer.valid?
        expect(customer.errors[:name]).to  include("can't be blank")
      end
      it 'without cpf' do
        customer = build(:customer, cpf: nil)
        customer.valid?
        expect(customer.errors[:cpf]).to  include("can't be blank")
      end
      it 'without income' do
        customer = build(:customer, income: nil)
        customer.valid?
        expect(customer.errors[:income]).to  include("can't be blank")
      end
      it 'without age' do
        customer = build(:customer, age: nil)
        customer.valid?
        expect(customer.errors[:age]).to  include("can't be blank")
      end
    end

    context 'fields with invalid data' do
      it 'cpf without 11 characters' do
        customer = build(:customer, cpf: '1234567891222222')
        customer.valid?
        expect(customer.errors[:cpf]).to  include("is invalid")
      end
      it 'cpf is not unique' do
        create(:customer)
        new_customer = build(:customer, cpf: customer.cpf)
        new_customer.valid?
        expect(new_customer.errors[:cpf]).to  include("has already been taken")
      end
    end
  end
end
