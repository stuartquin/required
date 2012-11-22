define [ "jquery", "underscore", "backbone", "views/login"],
( $, _, Backbone, LoginView ) ->

  HomeView = Backbone.View.extend
    el: '#main',

    initialize: (options) ->
      console.log "Init home view"
      @login_view = new LoginView()

    render: () ->
      console.log "Render home view"
