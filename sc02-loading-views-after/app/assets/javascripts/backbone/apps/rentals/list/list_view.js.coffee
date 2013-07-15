@LoadingViews.module "RentalsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Layout extends App.Views.Layout
		template: "rentals/list/list_layout"
		regions:
			resultsRegion: 		"#results-region"
			rentalsRegion:		"#rentals-region"
			paginationRegion:	"#pagination-region"

	class List.Rental extends App.Views.ItemView
		template: "rentals/list/_rental"
		tagName: "tr"

	class List.Rentals extends App.Views.CompositeView
		template: "rentals/list/_rentals"
		itemView: List.Rental
		itemViewContainer: "tbody"
	
	class List.Results extends App.Views.ItemView
		template: "rentals/list/_results"
	
	class List.Pagination extends App.Views.ItemView
		template: "rentals/list/_pagination"