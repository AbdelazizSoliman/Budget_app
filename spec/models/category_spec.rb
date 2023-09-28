# spec/models/category_spec.rb

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) } # Assuming you have a User model and a user factory

  describe 'validations' do
    it 'is valid with valid attributes' do
      category = build(:category, user: user) # Assuming you have a Category factory
      expect(category).to be_valid
    end

    it 'is not valid without a name' do
      category = build(:category, user: user, name: nil)
      expect(category).not_to be_valid
    end

    it 'is not valid without an icon' do
      category = build(:category, user: user, icon: nil)
      expect(category).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has and belongs to many purchases' do
      association = described_class.reflect_on_association(:purchases)
      expect(association.macro).to eq(:has_and_belongs_to_many)
    end
  end
end
