class Purchase < ApplicationRecord
    # Associations
    belongs_to :author, class_name: 'User'
    has_and_belongs_to_many :categories, join_table: 'purchase_category_associations'
  
    # Methods
  
    # Validations
  
    # Callbacks
  end
  