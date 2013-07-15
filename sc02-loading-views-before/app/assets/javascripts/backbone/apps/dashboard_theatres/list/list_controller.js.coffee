@LoadingViews.module "DashboardTheatresApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: ->
			theatres = App.request "theatre:movie:entities"
			
			theatreView = @getTheatreView theatres
			
			@show theatreView

		getTheatreView: (theatres) ->
			new List.Theatres
				collection: theatres