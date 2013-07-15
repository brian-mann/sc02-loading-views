@LoadingViews.module "RentalsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: ->
			rentals = App.request "movie:rental:entities"
			
			App.execute "when:fetched", rentals, =>
				## perform aggregates / sorting / nesting here
				## this is helpful when you want to perform operations but only after
				## all the required dependencies have been fetched and are available
				rentals.reset rentals.sortBy "runtime"
				
			@layout = @getLayoutView()
			
			@listenTo @layout, "show", =>
				@resultsView rentals
				@rentalsView rentals
				@paginationView rentals
			
			@show @layout,
				loading:
					entities: rentals
		
		resultsView: (rentals) ->
			resultsView = @getResultsView rentals
			@show resultsView, region: @layout.resultsRegion
		
		rentalsView: (rentals) ->
			rentalsView = @getMoviesView rentals
			@show rentalsView, region: @layout.rentalsRegion
		
		paginationView: (rentals) ->
			paginationView = @getPaginationView rentals
			@show paginationView, region: @layout.paginationRegion
		
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