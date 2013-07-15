@LoadingViews.module "DashboardUpcomingApp", (DashboardUpcomingApp, App, Backbone, Marionette, $, _) ->
		
	API =
		list: (region) ->
			new DashboardUpcomingApp.List.Controller
				region: region
	
	App.commands.setHandler "list:dashboard:upcoming:movies", (region) ->
		API.list region