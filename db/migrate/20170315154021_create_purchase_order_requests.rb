class CreatePurchaseOrderRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_order_requests do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :notes
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
