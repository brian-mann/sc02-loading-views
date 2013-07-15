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
				console.log "search:submitted: ", searchTerm
				@moviesView searchTerm
			
			@layout.panelRegion.show panelView
		
		moviesView: (searchTerm = null) ->
			if searchTerm then @searchView(searchTerm) else	@showHeroView()
		
		searchView: (searchTerm) ->
			movies = App.request "search:movie:entities", searchTerm

			moviesView = @getMoviesView movies
			
			@layout.moviesRegion.show moviesView
		
		showHeroView: ->
			heroView = @getHeroView()
			@layout.moviesRegion.show heroView
		
		getHeroView: ->
			new List.Hero
		
		getMoviesView: (movies) ->
			new List.Movies
				collection: movies
		
		getPanelView: ->
			new List.Panel

		getLayoutView: ->
			new List.Layout