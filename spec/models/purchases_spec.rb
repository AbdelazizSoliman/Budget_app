# spec/models/purchase_spec.rb

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it 'belongs to an author (User)' do
    association = described_class.reflect_on_association(:author)
    expect(association.macro).to eq(:belongs_to)
    expect(association.options[:class_name]).to eq('User')
  end

  it 'has and belongs to many categories' do
    association = described_class.reflect_on_association(:categories)
    expect(association.macro).to eq(:has_and_belongs_to_many)
    expect(association.options[:join_table]).to eq('purchase_category_associations')
  end
end
