@LoadingViews.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: ->
			@layout = @getLayoutView()

			@show @layout

		getLayoutView: ->
			new List.Layout