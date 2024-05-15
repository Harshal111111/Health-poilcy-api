class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :dob, :date
    add_column :users, :mobile_number, :string
    add_column :users, :admin, :boolean
  end
end
