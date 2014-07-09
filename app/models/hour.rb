class Hour < ActiveRecord::Base
  VALID_OPEN_TIMES = %w(
    11AM
    12PM
  )

  VALID_CLOSING_TIMES = %w(
    7PM
    8PM
    9PM
    10PM
    11PM
  )

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

  def closing_time_friendly
    closes_at.strftime("%l%p")
  end

  def opening_time_friendly
    opens_at.strftime("%l%p")
  end

  def update_times(updates)
    update(
      closes_at: updates[:closes_at],
      opens_at: updates[:opens_at]
    )
  end

  private

  def todays_day
    DateTime.now.in_time_zone("Eastern Time (US & Canada)").
      strftime("%A")
  end
end
