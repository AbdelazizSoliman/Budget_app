class Category < ApplicationRecord
    # Associations
    belongs_to :user
    has_and_belongs_to_many :purchases, join_table: 'purchase_category_associations'
  
    # Methods
  
    # Validations
  
    # Callbacks
  end
  