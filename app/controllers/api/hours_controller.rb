class Api::HoursController < ApiController
  before_action :verify_api_token

  def create
    if list_requested?
      render json: {
        text: hours_list_text
      }.to_json
    else
      hour.update_times(closes_at: closes_at, opens_at: opens_at)

      render json: {
        text: update_hours_text
      }
    end
  end

  private

  def list_requested?
    hour_update_params[:text] == 'list'
  end

  def update_hours_text
    "You just updated #{day}'s hours." \
    "Opening at #{hour.opening_time_friendly}" \
    "and closing at #{hour.closing_time_friendly}."
  end

  def hours_list_text
    "Monday: #{store.hours.find_by(day: 'Monday').opening_time_friendly} -"\
    "#{store.hours.find_by(day: 'Monday').closing_time_friendly}\n"\
    "Tuesday: #{store.hours.find_by(day: 'Tuesday').opening_time_friendly} -"\
    "#{store.hours.find_by(day: 'Tuesday').closing_time_friendly}\n"\
    "Wednesday: #{store.hours.find_by(day: 'Wednesday').opening_time_friendly} -"\
    "#{store.hours.find_by(day: 'Wednesday').closing_time_friendly}\n"\
    "Thursday: #{store.hours.find_by(day: 'Thursday').opening_time_friendly} -"\
    "#{store.hours.find_by(day: 'Thursday').closing_time_friendly}\n"\
    "Friday: #{store.hours.find_by(day: 'Friday').opening_time_friendly} -"\
    "#{store.hours.find_by(day: 'Friday').closing_time_friendly}\n"\
    "Saturday: #{store.hours.find_by(day: 'Saturday').opening_time_friendly} -"\
    "#{store.hours.find_by(day: 'Saturday').closing_time_friendly}\n"\
    "Sunday: #{store.hours.find_by(day: 'Sunday').opening_time_friendly} -"\
    "#{store.hours.find_by(day: 'Sunday').closing_time_friendly}\n"
  end

  def hour
    store.hours.find_by!(day: day)
  end

  def store
    Store.kristaks
  end

  def hour_update_params
    params.permit(
      :token,
      :text
    )
  end

  def day
    hour_update_params[:text].split(" ")[0]
  end

  def opens_at
    hour_update_params[:text].split(" ")[1]
  end

  def closes_at
    hour_update_params[:text].split(" ")[2]
  end

  def verify_api_token
    hour_update_params[:token] == ENV["SLACK_TOKEN"]
  end
end
