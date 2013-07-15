@LoadingViews.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "header/list/list_layout"

		regions:
			fooRegion: "#foo-region"