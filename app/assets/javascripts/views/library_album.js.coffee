class Backbonetunerails.Views.LibraryAlbum extends Backbonetunerails.Views.Album

  events:
    "click .queue.add": "select"

  select: ->
    @collection.trigger "select", @model