module Api
  class HoursController < ApiController
    DAYS_LIST =
      %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).freeze

    before_action :verify_slack_api_token

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
      "You just updated #{day}'s hours.\n"\
      "Opening at #{hour.opening_time_friendly} "\
      "and closing at #{hour.closing_time_friendly}."
    end

    def hours_list_text
      DAYS_LIST.map do |day_name|
        hours_for_day = store.hours.find_by(day: day_name)

        "#{day_name}: "\
        "#{hours_for_day.opening_time_friendly} -"\
        "#{hours_for_day.closing_time_friendly}"
      end.join("\n")
    end

    def hour
      @_hour ||= store.hours.find_by!(day: day.capitalize)
    end

    def store
      @_store ||= Store.kristaks
    end

    def hour_update_params
      params.permit(
        :token,
        :text
      )
    end

    def day
      hour_update_params[:text].split(' ')[0]
    end

    def opens_at
      hour_update_params[:text].split(' ')[1]
    end

    def closes_at
      hour_update_params[:text].split(' ')[2]
    end
  end
end
