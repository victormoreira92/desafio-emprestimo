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
FactoryBot.define do
  factory :loan do
    interest_rate { 2 }
    type_loan { 'personal' }
    association :customer
  end
end
