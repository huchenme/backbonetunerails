class Backbonetunerails.Views.Playlist extends Backbone.View

  tagName: "section"
  className: "playlist"
  template: JST['playlist']

  events:
    "click button.control.next": "nextTrack"
    "click button.control.prev": "prevTrack"
    "click button.control.play": "play"
    "click button.control.pause": "pause"

  initialize: ->
    @collection.on "reset", @render, this
    @collection.on "add", @renderAlbum, this
    @player = @options.player
    @player.on "change:state", @updateState, this
    @player.on "change:currentTrackIndex", @updateTrack, this
    @createAudio()
    @library = @options.library
    @library.on "select", @queueAlbum, this

  createAudio: ->
    @audio = new Audio()

  render: ->
    $(@el).html @template(@player.toJSON())
    @$("button.play").toggle @player.isStopped()
    @$("button.pause").toggle @player.isPlaying()
    this

  queueAlbum: (album) ->
    @collection.add album

  renderAlbum: (album) ->
    view = new Backbonetunerails.Views.PlaylistAlbum(
      model: album
      player: @player
      playlist: @collection
    )
    @$("ul").append view.render().el

  nextTrack: ->
    @player.nextTrack()

  prevTrack: ->
    @player.prevTrack()

  play: ->
    @player.play()

  pause: ->
    @player.pause()

  updateState: ->
    @updateTrack()
    @$("button.play").toggle @player.isStopped()
    @$("button.pause").toggle @player.isPlaying()

  updateTrack: ->
    @audio.src = @player.currentTrackUrl()
    if @player.get("state") is "play"
      @audio.play()
    else
      @audio.pause()