ActiveAdmin.setup do |config|
  config.site_title = "Krista K's Admin Interface"
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path
  config.batch_actions = true

  config.before_filter do
    params.permit!
  end
end
