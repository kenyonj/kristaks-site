STORE_HOURS = [
  ["Monday", "12PM", "11PM"],
  ["Tuesday", "12PM", "11PM"],
  ["Wednesday", "12PM", "11PM"],
  ["Thursday", "12PM", "11PM"],
  ["Friday", "12PM", "11PM"],
  ["Saturday", "12PM", "11PM"],
  ["Sunday", "12PM", "11PM"],
]

kristaks = Store.create(
  name: "Krista K's",
  address: "882 Route 28, West Dennis, MA 02670",
  phone_number: "5083986569"
)

STORE_HOURS.each do |day, opens, closes|
  kristaks.hours.create(day: day, opens_at: opens, closes_at: closes)
end
