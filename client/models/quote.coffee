define ["jquery", "underscore", "backbone"],
( $, _, Backbone) ->
  QuoteModel = Backbone.Model.extend
    defaults:
      rating: 0

    initialize: () ->
      return
  return QuoteModel
