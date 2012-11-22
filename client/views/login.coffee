define [ "jquery", "underscore", "backbone" ],
( $, _, Backbone ) ->

  LoginView = Backbone.View.extend
    initialize: (options) ->
      console.log "Init login view"

    render: () ->
      console.log "Render login view"
