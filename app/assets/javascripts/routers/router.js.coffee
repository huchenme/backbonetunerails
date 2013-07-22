class Backbonetunerails.Routers.Router extends Backbone.Router
  routes:
    "": "home"
    "blank": "blank"

  initialize: ->
    @library = new Backbonetunerails.Collections.Albums()
    @player = new Backbonetunerails.Models.Player()
    @library.fetch({reset: true})

  home: ->
    @libraryView = new Backbonetunerails.Views.Library(collection: @library)
    @playlistView = new Backbonetunerails.Views.Playlist(
      collection: @player.playlist
      player: @player
      library: @library
    )
    $container = $("#container")
    $container.empty()
    $container.append @playlistView.render().el
    $container.append @libraryView.render().el

  blank: ->
    $container = $("#container")
    $container.empty()
    $container.text "blank"