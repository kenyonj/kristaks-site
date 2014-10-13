class AddClosingDayToStore < ActiveRecord::Migration
  def change
    add_column :stores, :closing_day, :datetime
    add_column :stores, :opening_day, :datetime
  end
end
