class Backbonetunerails.Views.PlaylistAlbum extends Backbonetunerails.Views.Album

  events:
    "click .queue.remove": "removeFromPlaylist"

  initialize: ->
    @model.on("remove", @remove, this)
    @player = @options.player
    @player.on("change:state", @updateState, this)
    @player.on("change:currentTrackIndex", @updateTrack, this)

  removeFromPlaylist: ->
    @options.playlist.remove @model
    @player.reset()

  render: ->
    $(@el).html @template(@model.toJSON())
    @updateTrack()
    this

  updateState: ->
    isAlbumCurrent = (@player.currentAlbum() is @model)
    $(@el).toggleClass "current", isAlbumCurrent

  updateTrack: ->
    isAlbumCurrent = (@player.currentAlbum() is @model)
    if isAlbumCurrent
      currentTrackIndex = @player.get("currentTrackIndex")
      @$("li").each (index, el) ->
        $(el).toggleClass "current", index is currentTrackIndex
    @updateState()