@LoadingViews.module "SearchApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: ->
			@layout = @getLayoutView()

			@listenTo @layout, "show", =>
				@panelView()
				@moviesView()

			@show @layout
		
		panelView: ->
			panelView = @getPanelView()
			
			@listenTo panelView, "search:submitted", (searchTerm) =>
				@moviesView searchTerm
			
			@show panelView, region: @layout.panelRegion
		
		moviesView: (searchTerm = null) ->
			if searchTerm then @searchView(searchTerm) else	@showHeroView()
		
		searchView: (searchTerm) ->
			movies = App.request "search:movie:entities", searchTerm

			moviesView = @getMoviesView movies
			
			opts =
				region: @layout.moviesRegion
				loading: true
			
			opts.loading = { loadingType: "opacity" } if @layout.moviesRegion.currentView isnt @heroView
			
			@show moviesView, opts
		
		showHeroView: ->
			@heroView = @getHeroView()
			@show @heroView, region: @layout.moviesRegion
		
		getHeroView: ->
			new List.Hero
		
		getMoviesView: (movies) ->
			new List.Movies
				collection: movies
		
		getPanelView: ->
			new List.Panel

		getLayoutView: ->
			new List.Layout