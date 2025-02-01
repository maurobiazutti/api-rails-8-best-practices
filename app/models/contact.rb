class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :kind, required: true
  has_many :phones, dependent: :destroy
  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address, update_only: true
  accepts_nested_attributes_for :phones, allow_destroy: true
end
