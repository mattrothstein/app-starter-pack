class CreateSupportRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :support_requests do |t|
      t.string :status
      t.string :issue
      t.string :priority
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
