class Hour < ActiveRecord::Base
  belongs_to :store
  validates :day, uniqueness: true

  def today?
    day == todays_day
  end

  def closing_time_int
    closes_at.strftime("%H%M").to_i
  end

  def opening_time_int
    opens_at.strftime("%H%M").to_i
  end

  private

  def todays_day
    DateTime.now.in_time_zone("Eastern Time (US & Canada)").
      strftime("%A")
  end
end
