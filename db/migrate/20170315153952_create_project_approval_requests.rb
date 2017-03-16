class CreateProjectApprovalRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :project_approval_requests do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :notes
      t.string :status

      t.timestamps
    end
  end
end
