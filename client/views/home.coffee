define [ "jquery",
         "underscore",
         "backbone",
         "text!/javascript/templates/home.html"
],
( $, _, Backbone, HomeTemplate) ->
  HomeView = Backbone.View.extend
    el:       "#main",
    template: _.template HomeTemplate

    initialize: ( options ) ->
      @collection = options.collection
      @collection.bind "reset", @render, this

    render: () ->
      $( @el ).html @template
