class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.float :quantity
      t.text :name
      t.references :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
