@LoadingViews = do (Backbone, Marionette) ->

	App = new Marionette.Application			

	App.addRegions
		headerRegion: 	"#header-region"
		mainRegion:			"#main-region"
		footerRegion:		"#footer-region"
	
	App.rootRoute = "dashboard"

	App.reqres.setHandler "default:region", ->
		App.mainRegion

	App.addInitializer ->
		App.module("HeaderApp").start()
		App.module("FooterApp").start()
	
	App.commands.setHandler "register:instance", (instance, id) ->
		App.register instance, id
	
	App.commands.setHandler "unregister:instance", (instance, id) ->
		App.unregister instance, id

	App.on "initialize:after", (options) ->
		@startHistory()
		@navigate(@rootRoute, trigger: true) unless @getCurrentRoute()

	App