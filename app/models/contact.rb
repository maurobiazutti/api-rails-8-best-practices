class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :kind, required: true
  has_many :phones, dependent: :destroy
  has_one :address, dependent: :destroy

  validates :name, presence: { message: "O nome é obrigatório" },
                               length: { in: 3..50 }

  validates :email, presence: { message: "O email é obrigatório" },
                    uniqueness: { case_sensitive: false, scope: :user_id, message: "já está cadastrado para este usuário" },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "Formato de email inválido" },
                    length: { maximum: 100 }

  validates_date :birthdate, on_or_before: lambda { Date.current - 18.years },
                             message: "deve ter pelo menos 18 anos"

  validates :kind, :user, presence: true

  accepts_nested_attributes_for :address, update_only: true
  accepts_nested_attributes_for :phones, allow_destroy: true
end
