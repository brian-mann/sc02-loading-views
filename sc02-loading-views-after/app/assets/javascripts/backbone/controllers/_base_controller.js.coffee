@LoadingViews.module "Controllers", (Controllers, App, Backbone, Marionette, $, _) ->

	class Controllers.Base extends Marionette.Controller

		constructor: (options = {}) ->
			@region = options.region or App.request "default:region"
			@_instance_id = _.uniqueId("controller")
			App.execute "register:instance", @, @_instance_id
			super

		close: ->
			App.execute "unregister:instance", @, @_instance_id
			super
		
		show: (view, options = {}) ->
			_.defaults options,
				loading: false
				region: @region			
			
			@_setMainView view
			@_manageView view, options
		
		_setMainView: (view) ->
			## the first view we show is always going to become the mainView of our
			## controller (whether its a layout or another view type).  So if this
			## *is* a layout, when we show other regions inside of that layout, we 
			## check for the existance of a mainView first, so our controller is only
			## closed down when the original mainView is closed.
			
			return if @_mainView
			@_mainView = view
			@listenTo view, "close", @close
		
		_manageView: (view, options) ->
			if options.loading
				## show the loading view
				App.execute "show:loading", view, options
			else
				options.region.show view