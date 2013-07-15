@LoadingViews.module "DashboardUpcomingApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: ->
			upcoming = App.request "upcoming:movie:entities"
			window.upcoming = upcoming
			
			upcomingView = @getUpcomingView upcoming
			
			@show upcomingView

		getUpcomingView: (upcoming) ->
			new List.UpcomingMovies
				collection: upcoming