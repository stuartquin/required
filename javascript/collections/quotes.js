// Generated by CoffeeScript 1.3.3
(function() {

  define(["jquery", "underscore", "backbone", "models/quote"], function($, _, Backbone, QuoteModel) {
    var QuotesCollection;
    QuotesCollection = Backbone.Collection.extend({
      model: QuoteModel,
      url: "/quotes",
      initialize: function(options) {}
    });
    return QuotesCollection;
  });

}).call(this);
