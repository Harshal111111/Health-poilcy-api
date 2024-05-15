class CreateHealthPolicies < ActiveRecord::Migration[7.0]
  def change
    create_table :health_policies do |t|
      t.string :name
      t.date :expiry
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
