@LoadingViews.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Movie extends Entities.Model

	class Entities.MoviesCollection extends Entities.Collection
		model: Entities.Movie

	API =
		getMovies: ->
			new Entities.MoviesCollection [
				{ title: "Foo", year: 2013, mpaa_rating: "R", runtime: 180, ratings: { critics_score: 100 }, release_dates: theater: "2013-07-12" }
				{ title: "Bar", year: 2012, mpaa_rating: "PG", runtime: 160, ratings: { critics_score: 92 }, release_dates: theater: "2013-07-13" }
				{ title: "Baz", year: 2011, mpaa_rating: "G", runtime: 200, ratings: { critics_score: 87 }, release_dates: theater: "2013-07-14" }
			]

	App.reqres.setHandler "movie:rental:entities", ->
		API.getMovies()
	
	App.reqres.setHandler "search:movie:entities", (searchTerm) ->
		API.getMovies()
	
	App.reqres.setHandler "theatre:movie:entities", ->
		API.getMovies()
	
	App.reqres.setHandler "upcoming:movie:entities", ->
		API.getMovies()
		
# Use this in your browser's console to initialize a JSONP request to see the API in action.
# $.getJSON("http://api.rottentomatoes.com/api/public/v1.0/movies.json?callback=?", {apikey: "vzjnwecqq7av3mauck2238uj", q: "shining"})