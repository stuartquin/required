express  = require "express"
fs       = require "fs"
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

    @app.get "/quotes", @quotes

  quotes: ( req, res ) =>
    console.log req.query
    res.send @read_file "quotes.txt"

  read_file: ( filename, cb ) ->
    data   = fs.readFileSync filename
    quotes = []

    for row in data.toString().split "\n"
      fields = row.split "|"
      quote =
        season:  fields[0]
        episode: fields[1]
        quote:   fields[2]

      quotes.push quote
    return quotes

application = new exports.App(app)
