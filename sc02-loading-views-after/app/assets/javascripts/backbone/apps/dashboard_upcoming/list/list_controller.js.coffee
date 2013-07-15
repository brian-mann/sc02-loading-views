@LoadingViews.module "DashboardUpcomingApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: ->
			upcoming = App.request "upcoming:movie:entities"
			
			upcomingView = @getUpcomingView upcoming
			
			@show upcomingView,
				loading: true

		getUpcomingView: (upcoming) ->
			new List.UpcomingMovies
				collection: upcoming