LoadingViews::Application.configure do
	config.marionette = {}

	## client side marionette application instance name
	config.marionette[:app_name] = 'LoadingViews'	

	## are we using js-routes for url and urlRoot properties on entities?
	config.marionette[:js_routes] = false

	## whether we're using base views to extend from
	config.marionette[:base_views] = true
end