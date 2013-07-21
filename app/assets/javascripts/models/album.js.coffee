class Backbonetunerails.Models.Album extends Backbone.Model
  isFirstTrack: (index) ->
    index is 0

  isLastTrack: (index) ->
    index >= @get("tracks").length - 1

  trackUrlAtIndex: (index) ->
    tracks = @get("tracks")
    if tracks? and tracks.length >= index
      @get("tracks")[index].url
    else
      null