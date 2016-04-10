STORE_HOURS = [
  ["Monday", "12PM", "11PM", false],
  ["Tuesday", "12PM", "11PM", false],
  ["Wednesday", "12PM", "11PM", false],
  ["Thursday", "12PM", "9PM", false],
  ["Friday", "12PM", "10PM", true],
  ["Saturday", "12PM", "10PM", true],
  ["Sunday", "12PM", "9PM", true],
]

kristaks = Store.find_or_initialize_by(name: "Krista K's")
kristaks.update(
  address: "882 Route 28, West Dennis, MA 02670",
  phone_number: "5083986569",
  closing_day: DateTime.new(2015,10,14,12,0,0).in_time_zone('EST'),
  opening_day: DateTime.new(2015,4,17,12,0,0).in_time_zone('EST'),
  hours_header_text: "See you in April 2015!",
)

kristaks.hours.destroy_all

STORE_HOURS.each do |day, opens, closes, working|
  kristaks.hours.create(day: day, opens_at: opens, closes_at: closes, working: working)
end
