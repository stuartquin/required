require.config
  # Short hand paths to Load these libraries
  paths:
    jquery: "lib/jquery/jquery-min"
    underscore: "lib/underscore/underscore-min"
    backbone: "lib/backbone/backbone-min"

  shim:
    jquery_carousel:
      deps: ["jquery"]

    backbone:
      deps: ["underscore", "jquery"]
      exports: "Backbone"

    underscore:
      exports: "_"

define [ "jquery", "router" ],
($, Router) ->
  # This is the entry point for the client code
  Router.initialize()
