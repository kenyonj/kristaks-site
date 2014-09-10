class Store < ActiveRecord::Base
  has_many :hours, dependent: :destroy

  has_many :flavors, dependent: :destroy
  has_many :hard_serve_flavors, class_name: "HardServe"
  has_many :soft_serve_flavors, class_name: "SoftServe"
  has_many :smoothie_flavors, class_name: "Smoothie"
  has_many :fudge_flavors, class_name: "Fudge"

  def self.kristaks
    find(1)
  end

  def open?
    before_closing_time? && after_opening_time?
  end

  def map_url
    "http://maps.google.com/?q=#{name}+#{address}"
  end

  def flavors_by_name(type)
    flavors.where(type: type).
      order(:name)
  end

  private

  def before_closing_time?
    time_now_integer < todays_closing_time_integer
  end

  def after_opening_time?
    time_now_integer > todays_opening_time_integer
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
