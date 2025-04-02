FactoryBot.define do
  factory :customer, class: Hash do
    name { Faker.name }
    cpf { Faker::Alphanumeric.alphanumeric(number: 11, min_numeric: 11)}
    age { Faker::Number.between(from: 15, to: 50)}
    income { Faker::Number.between(from:1200, to: 10000) }
    location { Faker::Locations::Australia.location }
  end

  initialize_with do
    {
      customer: attributes.stringify_keys # Converte para o formato de params do Rails
    }
  end
end
