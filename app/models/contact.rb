class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, allow_destroy: true
end
