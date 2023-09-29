# spec/models/category_spec.rb

require 'rails_helper'

RSpec.describe Category, type: :model do
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
