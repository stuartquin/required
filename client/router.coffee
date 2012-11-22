define ["jquery", "underscore", "backbone", "views/home"],
( $, _, Backbone, HomeView ) ->
  AppRouter = Backbone.Router.extend
    routes:
      "home":     "home"
      "test":     "test"

    home: () ->
      home_view = new HomeView()
      home_view.render()

    test: () ->
      console.log "test"

  initialize: () ->
    app_router = new AppRouter()
    Backbone.history.start()
