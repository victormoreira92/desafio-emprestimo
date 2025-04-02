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
FactoryBot.define do
  factory :customer, class: Hash do
    name { Faker.name }
    cpf { Faker::Alphanumeric.alphanumeric(number: 11, min_numeric: 11) }
    age { Faker::Number.between(from: 15, to: 50) }
    income { Faker::Number.between(from: 1200, to: 10_000) }
    location { Faker::Locations::Australia.location }
  end

  trait :without_name do
    name { nil }
  end

  trait :without_cpf do
    cpf { nil }
  end

  trait :without_age do
    age { nil }
  end

  trait :without_income do
    income { nil }
  end

  trait :without_location do
    location { nil }
  end

  initialize_with do
    {
      customer: attributes.stringify_keys # Converte para o formato de params do Rails
    }
  end
end
