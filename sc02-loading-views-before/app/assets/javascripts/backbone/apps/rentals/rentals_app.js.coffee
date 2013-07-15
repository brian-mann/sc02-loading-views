@LoadingViews.module "RentalsApp", (RentalsApp, App, Backbone, Marionette, $, _) ->

	class RentalsApp.Router extends Marionette.AppRouter
		appRoutes:
			"rentals": "list"
		
	API =
		list: ->
			new RentalsApp.List.Controller
			
	App.addInitializer ->
		new RentalsApp.Router
			controller: API
	