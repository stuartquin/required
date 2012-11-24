define ["jquery",
        "underscore",
        "backbone",
        "collections/quotes",
        "views/home"
],
( $, _, Backbone, QuotesCollection, HomeView ) ->
  AppRouter = Backbone.Router.extend
    routes:
      "home":     "home"
      "test":     "test"

    home: () ->
      quotes_collection = new QuotesCollection()
      quotes_collection.fetch()
      home_view = new HomeView( collection: quotes_collection )

    test: () ->
      console.log "test"

  initialize: () ->
    app_router = new AppRouter()
    Backbone.history.start()
