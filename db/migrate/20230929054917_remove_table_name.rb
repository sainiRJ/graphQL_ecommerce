class RemoveTableName < ActiveRecord::Migration[7.0]
  def up
    create_table :order do |t|
      # Define the table columns here
      t.integer :quantity
      t.references :user
      t.references :product
      # ...
      t.timestamps
  end
end

 end
