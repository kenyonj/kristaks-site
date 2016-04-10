class AddHoursHeaderTextToStores < ActiveRecord::Migration
  def change
    add_column :stores, :hours_header_text, :text, null: false, default: ""
  end
end
