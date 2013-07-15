@LoadingViews.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Movie extends Entities.Model

	class Entities.MoviesCollection extends Entities.Collection
		model: Entities.Movie
		
		parse: (resp) ->
			resp.movies

	API =
		getMovies: (url, params = {}) ->
			_.defaults params,
				apikey: "vzjnwecqq7av3mauck2238uj" ## App.request "rotten:tomatoes:api:key"
				country: "us"
			
			movies = new Entities.MoviesCollection
			movies.url = "http://api.rottentomatoes.com/api/public/v1.0/#{url}.json?callback=?"
			movies.fetch
				reset: true
				data: params
			movies
		
	App.reqres.setHandler "movie:rental:entities", ->
		API.getMovies "lists/dvds/top_rentals",
			limit: 20
	
	App.reqres.setHandler "search:movie:entities", (searchTerm) ->
		API.getMovies "movies",
			q: $.trim(searchTerm)
	
	App.reqres.setHandler "theatre:movie:entities", ->
		API.getMovies "lists/movies/in_theaters",
			page_limit: 10
			page: 1
	
	App.reqres.setHandler "upcoming:movie:entities", ->
		API.getMovies "lists/movies/upcoming",
			page_limit: 10
			page: 1
		
# Use this in your browser's console to initialize a JSONP request to see the API in action.
# $.getJSON("http://api.rottentomatoes.com/api/public/v1.0/movies.json?callback=?", {apikey: "vzjnwecqq7av3mauck2238uj", q: "shining"})