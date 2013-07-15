@LoadingViews.module "DashboardUpcomingApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.UpcomingMovie extends App.Views.ItemView
		template: "dashboard_upcoming/list/_upcoming_movie"
		tagName: "tr"

	class List.UpcomingMovies extends App.Views.CompositeView
		template: "dashboard_upcoming/list/upcoming_movies"
		itemView: List.UpcomingMovie
		itemViewContainer: "tbody"