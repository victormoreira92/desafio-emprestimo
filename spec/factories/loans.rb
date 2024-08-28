FactoryBot.define do
  factory :loan do
    interest_rate { 2 }
    type_loan { 'personal' }
    association :customer
  end
end
