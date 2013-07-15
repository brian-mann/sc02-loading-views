@LoadingViews.module "RentalsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: ->
			rentals = App.request "movie:rental:entities"
			
			@layout = @getLayoutView()
			
			@listenTo @layout, "show", =>
				@resultsView rentals
				@rentalsView rentals
				@paginationView rentals
			
			@show @layout
		
		resultsView: (rentals) ->
			resultsView = @getResultsView rentals
			@layout.resultsRegion.show resultsView
		
		rentalsView: (rentals) ->
			rentalsView = @getMoviesView rentals
			@layout.rentalsRegion.show rentalsView
		
		paginationView: (rentals) ->
			paginationView = @getPaginationView rentals
			@layout.paginationRegion.show paginationView
		
		getResultsView: (rentals) ->
			new List.Results
				collection: rentals
		
		getPaginationView: (rentals) ->
			new List.Pagination
				collection: rentals
		
		getMoviesView: (rentals) ->
			new List.Rentals
				collection: rentals
		
		getLayoutView: ->
			new List.Layout