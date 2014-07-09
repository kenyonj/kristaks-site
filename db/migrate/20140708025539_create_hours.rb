class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.belongs_to :store, index: true
      t.string :day
      t.time :opens_at
      t.time :closes_at

      t.timestamps
    end
  end
end
