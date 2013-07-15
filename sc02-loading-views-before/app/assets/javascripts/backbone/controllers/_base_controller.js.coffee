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
		
		show: (view) ->
			@listenTo view, "close", @close
			@region.show view