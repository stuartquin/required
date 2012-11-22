define [ "jquery", "underscore", "backbone", "views/login", "text!/javascript/templates/home.html"],
( $, _, Backbone, LoginView, HeaderTemplate) ->

  HomeView = Backbone.View.extend
    el:       "#main",
    template: _.template HeaderTemplate

    initialize: (options) ->
      @login_view = new LoginView()

    render: () ->
      $( @el ).html @template
