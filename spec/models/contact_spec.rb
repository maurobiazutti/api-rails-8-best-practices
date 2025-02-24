require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "deve imprimir os atributos do contact" do
    contact = create(:contact)
    puts contact.inspect  # Mostra os detalhes no console
  end

  describe "associações" do
    it { is_expected.to belong_to(:user).class_name('User') }
    it { is_expected.to belong_to(:kind).class_name('Kind') }
    it { is_expected.to have_many(:phones).dependent(:destroy) }
    it { is_expected.to have_one(:address).dependent(:destroy) }
  end

  describe "validações" do
    subject { build(:contact) }

    context "validações de presença" do
      it { is_expected.to validate_presence_of(:name).with_message("O nome é obrigatório") }
      it { is_expected.to validate_presence_of(:email).with_message("O email é obrigatório") }
      it { is_expected.to validate_presence_of(:kind) }
      it { is_expected.to validate_presence_of(:user) }
    end

    context "validações de formato e tamanho" do
      it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(50) }
      it { is_expected.to validate_length_of(:email).is_at_most(100) }
      it { is_expected.to allow_value("teste@example.com").for(:email) }
      it { is_expected.not_to allow_value("email_invalido").for(:email).with_message("Formato de email inválido") }
    end
  end

  describe "validações de data de nascimento" do
    let(:under_age_user) { build(:contact, birthdate: 18.years.ago + 1.day) }
    let(:exact_age_user) { build(:contact, birthdate: 18.years.ago) }
    let(:older_user) { build(:contact, birthdate: 30.years.ago) }
    let(:future_birth_user) { build(:contact, birthdate: Date.current + 1.day) }
    let(:no_birth_user) { build(:contact, birthdate: nil) }

    context "quando tem menos de 18 anos" do
      it "é inválido" do
        expect(under_age_user).not_to be_valid
        expect(under_age_user.errors[:birthdate]).to include("deve ter pelo menos 18 anos")
      end
    end

    context "quando tem exatamente 18 anos" do
      it "é válido" do
        expect(exact_age_user).to be_valid
      end
    end

    context "quando tem mais de 18 anos" do
      it "é válido" do
        expect(older_user).to be_valid
      end
    end

    context "quando a data está no futuro" do
      it "é inválido" do
        expect(future_birth_user).not_to be_valid
        expect(future_birth_user.errors[:birthdate]).to be_present
      end
    end

    context "quando a data não é fornecida" do
      it "é inválido" do
        expect(no_birth_user).not_to be_valid
        expect(no_birth_user.errors[:birthdate]).to be_present
      end
    end
  end
end
