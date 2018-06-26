module Api
  class HoursController < ApiController
    DAYS_LIST =
      %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).freeze

    before_action :verify_slack_api_token

    def create
      if list_requested?
        render json: updated_hours_json_response(
          text: 'Here are the current hours:'
        )
      else
        hour.update_times(closes_at: closes_at, opens_at: opens_at)

        render json: updated_hours_json_response(
          text: "#{user_name} just updated the hours for #{day}."
        )
      end
    end

    private

    def updated_hours_json_response(text:)
      {
        response_type: 'in_channel',
        text: text,
        attachments: [
          {
            text: hours_list_text
          }
        ]
      }
    end

    def list_requested?
      hour_update_params[:text] == 'list'
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
        :text,
        :user_name
      )
    end

    def user_name
      hour_update_params[:user_name]
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
