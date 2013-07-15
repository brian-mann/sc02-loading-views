@LoadingViews.module "DashboardTheatresApp", (DashboardTheatresApp, App, Backbone, Marionette, $, _) ->

	API =
		list: (region) ->
			new DashboardTheatresApp.List.Controller
				region: region
	
	App.commands.setHandler "list:dashboard:theatre:movies", (region) ->
		API.list region