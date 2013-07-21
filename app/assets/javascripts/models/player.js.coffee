class Backbonetunerails.Models.Player extends Backbone.Model
  defaults:
    "currentAlbumIndex": 0
    "currentTrackIndex": 0
    "state": "stop"

  initialize: ->
    @playlist = new Backbonetunerails.Collections.Playlist()

  play: ->
    @set "state": "play"

  pause: ->
    @set "state": "pause"

  isPlaying: ->
    @get("state") is "play"

  isStopped: ->
    not @isPlaying()

  currentAlbum: ->
    @playlist.at @get("currentAlbumIndex")

  currentTrackUrl: ->
    album = @currentAlbum()
    if album
      album.trackUrlAtIndex @get("currentTrackIndex")
    else
      null

  prevTrack: ->
    currentTrackIndex = @get("currentTrackIndex")
    currentAlbumIndex = @get("currentAlbumIndex")
    if @currentAlbum().isFirstTrack(currentTrackIndex)
      if @playlist.isFirstAlbum(currentAlbumIndex)
        @set currentAlbumIndex: @playlist.models.length - 1
      else
        @set currentAlbumIndex: currentAlbumIndex - 1
      lastTrackIndex = @currentAlbum().get("tracks").length - 1
      @set "currentTrackIndex", lastTrackIndex
    else
      @set currentTrackIndex: currentTrackIndex - 1
    # @logCurrentAlbumAndTrack()

  nextTrack: ->
    currentTrackIndex = @get("currentTrackIndex")
    currentAlbumIndex = @get("currentAlbumIndex")
    if @currentAlbum().isLastTrack(currentTrackIndex)
      if @playlist.isLastAlbum(currentAlbumIndex)
        @set currentAlbumIndex: 0
        @set currentTrackIndex: 0
      else
        @set currentAlbumIndex: currentAlbumIndex + 1
        @set currentTrackIndex: 0
    else
      @set currentTrackIndex: currentTrackIndex + 1
    # @logCurrentAlbumAndTrack()

  logCurrentAlbumAndTrack: ->
    console.log "Player " + @get("currentAlbumIndex") + ":" + @get("currentTrackIndex"), this