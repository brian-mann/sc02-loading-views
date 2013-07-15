@LoadingViews.module "SearchApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "search/list/list_layout"

		regions:
			panelRegion: 	"#panel-region"
			moviesRegion:	"#movies-region"
	
	class List.Panel extends App.Views.ItemView
		template: "search/list/_panel"
		
		ui:
			"input" : "input"

		events:
			"submit form" : "formSubmitted"
		
		formSubmitted: (e) ->
			e.preventDefault()
			val = $.trim @ui.input.val()
			@trigger "search:submitted", val
	
	class List.Movie extends App.Views.ItemView
		template: "search/list/_movie"
		tagName: "tr"
	
	class List.Movies extends App.Views.CompositeView
		template: "search/list/_movies"
		itemView: List.Movie
		itemViewContainer: "tbody"
	
	class List.Hero extends App.Views.ItemView
		template: "search/list/_hero"