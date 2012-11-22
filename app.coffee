express  = require "express"
app      = express()
server   = require('http').createServer(app)

class exports.App
  constructor: (@app) ->
    # Configuration
    @app.configure =>
      @app.use express.bodyParser()
      @app.use express.methodOverride()
      @app.use express.cookieParser()
      @app.use @app.router
      @app.use express.static( __dirname )

    server.listen 3000
    console.log "Listening on Port: ", 3000

application = new exports.App(app)
