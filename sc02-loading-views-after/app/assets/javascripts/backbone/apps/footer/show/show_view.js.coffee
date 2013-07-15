@LoadingViews.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Layout extends App.Views.Layout
		template: "footer/show/show_layout"

		regions:
			fooRegion: "#foo-region"