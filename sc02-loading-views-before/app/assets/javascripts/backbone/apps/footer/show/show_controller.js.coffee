@LoadingViews.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Controller extends App.Controllers.Base

		initialize: ->
			@layout = @getLayoutView()

			@show @layout

		getLayoutView: ->
			new Show.Layout