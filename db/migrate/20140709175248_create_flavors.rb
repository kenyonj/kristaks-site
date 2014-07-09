class CreateFlavors < ActiveRecord::Migration
  def change
    create_table :flavors do |t|
      t.belongs_to :store, index: true
      t.string :type
      t.string :name
      t.boolean :in_stock
      t.string :description

      t.timestamps
    end
  end
end
