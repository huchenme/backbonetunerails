class Backbonetunerails.Routers.Router extends Backbone.Router
  routes:
    "": "home"
    "blank": "blank"

  initialize: ->
    # @libraryView = new LibraryView(collection: window.library)
    # @playlistView = new PlaylistView(
    #   collection: window.player.playlist
    #   player: window.player
    #   library: window.library
    # )

  home: ->
    $container = $("#container")
    $container.empty()
    # $container.append @playlistView.render().el
    # $container.append @libraryView.render().el
    $container.text "index"

  blank: ->
    $container = $("#container")
    $container.empty()
    $container.text "blank"