if Rails.env == "production" || Rails.env == "staging" || Rails.env == "development"

	exceptions = []
	exceptions << 'ActiveRecord::RecordNotFound'
	exceptions << 'AbstractController::ActionNotFound'
	exceptions << 'ActionController::RoutingError'
	exceptions << 'ActionController::InvalidAuthenticityToken'

	server_name = case Rails.env
		when 'production'   then "mystore.com"
		when 'staging'      then "staging.mystore.com"
		when 'development'	then "DEVELOPMENT my_store"
		else
			"unknown env my_store"
	end
	MyStore::Application.config.middleware.use ExceptionNotification::
Rack,	
	
		email: {
			email_prefix: "[#{MyStore} error]",
			sender_address: "error500@mystore.com",
			exception_recipients: ["rafik2516@gmail.com"]
				},
	
	ignore_exceptions: exceptions

end		