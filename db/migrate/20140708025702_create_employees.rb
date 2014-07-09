class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.belongs_to :store, index: true
      t.string :first_name
      t.string :last_name
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
