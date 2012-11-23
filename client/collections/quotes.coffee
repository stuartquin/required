define ["jquery", "underscore", "backbone", "models/quote"],
( $, _, Backbone, QuoteModel) ->
  QuotesCollection = Backbone.Collection.extend
    model:      QuoteModel
    url:        "/quotes"

    initialize: (options) ->
      return
  return QuotesCollection
