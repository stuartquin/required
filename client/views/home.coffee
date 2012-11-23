define [ "jquery",
         "underscore",
         "backbone",
         "collections/quotes",
         "text!/javascript/templates/home.html"
],
( $, _, Backbone, QuotesCollection, HomeTemplate) ->
  HomeView = Backbone.View.extend
    el:       "#main",
    template: _.template HomeTemplate

    initialize: (options) ->
      console.log "../models/quote"
      @quotes_collection = new QuotesCollection()
      @quotes_collection.fetch()

    render: () ->
      $( @el ).html @template
