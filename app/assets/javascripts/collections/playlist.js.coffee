class Backbonetunerails.Collections.Playlist extends Backbonetunerails.Collections.Albums
  isFirstAlbum: (index) ->
    index is 0

  isLastAlbum: (index) ->
    index is @models.length - 1