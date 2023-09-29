class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.string :imageUrl
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
