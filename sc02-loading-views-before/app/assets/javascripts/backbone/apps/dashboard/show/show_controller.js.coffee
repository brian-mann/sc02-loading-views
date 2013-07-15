@LoadingViews.module "DashboardApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Controller extends App.Controllers.Base

		initialize: ->
			@layout = @getLayoutView()

			@listenTo @layout, "show", =>
				@listUpcoming()
				@listTheatre()

			@show @layout
		
		listUpcoming: ->
			App.execute "list:dashboard:upcoming:movies", @layout.upcomingRegion
		
		listTheatre: ->
			App.execute "list:dashboard:theatre:movies", @layout.theatreRegion

		getLayoutView: ->
			new Show.Layout