class Store < ActiveRecord::Base
  has_many :hours, dependent: :destroy

  has_many :flavors, dependent: :destroy
  has_many :hard_serve_flavors, class_name: "HardServe"
  has_many :soft_serve_flavors, class_name: "SoftServe"
  has_many :smoothie_flavors, class_name: "Smoothie"
  has_many :fudge_flavors, class_name: "Fudge"

  def self.kristaks
    first
  end

  def open?
    if working? && in_season?
      before_closing_time? && after_opening_time?
    end
  end

  def in_season?
   before_closing_day?
  end

  def off_season?
    !in_season?
  end

  def map_url
    "http://maps.google.com/?q=#{name}+#{address}"
  end

  def flavors_by_name(type)
    flavors.where(type: type).
      order(:name)
  end

  private

  def working?
    hours.find_by(day: today_name).working?
  end

  def before_closing_day?
    date_now_integer < closing_day_integer
  end

  def before_closing_time?
    time_now_integer < todays_closing_time_integer
  end

  def after_opening_time?
    time_now_integer > todays_opening_time_integer
  end

  def date_now_integer
    DateTime.now.in_time_zone("Eastern Time (US & Canada)").
      strftime("%m%d%Y").
      to_i
  end

  def closing_day_integer
    closing_day.strftime("%m%d%Y").to_i
  end

  def time_now_integer
    DateTime.now.in_time_zone("Eastern Time (US & Canada)").
      strftime("%H%M").
      to_i
  end

  def todays_closing_time_integer
    hours.find_by(day: today_name).closing_time_int
  end

  def todays_opening_time_integer
    hours.find_by(day: today_name).opening_time_int
  end

  def today_name
    DateTime.now.in_time_zone("Eastern Time (US & Canada)").
      strftime("%A")
  end
end
