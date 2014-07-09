class AddUserToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :user_id, :integer, null: false
  end
end
