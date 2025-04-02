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
class Customer < ApplicationRecord
  has_many :loans, dependent: :destroy
  include LoanCreator

  validates :name, :age, :cpf, :income, :location, presence: true
  validates :cpf, uniqueness: true
  validates :cpf, format: { with: /\A\d{11}\z/ }
end
