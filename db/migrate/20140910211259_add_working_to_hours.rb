class AddWorkingToHours < ActiveRecord::Migration
  def change
    add_column :hours, :working, :boolean, default: true, null: false
  end
end
