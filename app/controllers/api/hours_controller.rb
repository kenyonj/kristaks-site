class Api::HoursController < ApiController
  def create
    if hour_update_params[:token] == ENV["SLACK_TOKEN"]
      hour.update_times(closes_at: closes_at, opens_at: opens_at)
      head 200
    else
      head 404
    end
  end

  private

  def hour
    store.hours.find_by!(day: day)
  end

  def store
    Store.kristaks
  end

  def hour_update_params
    params.permit(
      :token,
      :text,
    )
  end

  def day
    hour_update_params.split(" ")[0]
  end

  def opens_at
    hour_update_params.split(" ")[1]
  end

  def closes_at
    hour_update_params.split(" ")[2]
  end
end
