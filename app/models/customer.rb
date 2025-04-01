
class Customer < ApplicationRecord
  has_many :loans, dependent: :destroy
  include LoanCreator

  validates :name, :age, :cpf, :income, :location, presence: true
  validates :cpf, uniqueness: true
  validates :cpf, format: { with: /\A\d{11}\z/ }
end
