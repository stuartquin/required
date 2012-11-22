define [ "jquery", "router" ],
($, Router) ->
  initialize = () ->
    # This is the entry point for the client code
    console.log "Initialise router"
    Router.initialize()

  initialize: initialize
