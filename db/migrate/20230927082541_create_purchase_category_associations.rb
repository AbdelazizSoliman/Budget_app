class CreatePurchaseCategoryAssociations < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_category_associations do |t|
      t.references :purchase, foreign_key: true
      t.references :category, foreign_key: true
      
      t.timestamps
    end
  end
end
