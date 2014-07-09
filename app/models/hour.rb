class Hour < ActiveRecord::Base
  belongs_to :store
  validates :day, uniqueness: true

  def today?
    day == DateTime.now.strftime("%A")
  end

  def closing_time_int
    closes_at.strftime("%H%M").to_i
  end

  def opening_time_int
    opens_at.strftime("%H%M").to_i
  end
end
