class ApiController < ActionController::Base
  protect_from_forgery with: :null_session

  def verify_slack_api_token
    params[:token] == ENV['SLACK_TOKEN']
  end
end
