class Backbonetunerails.Views.Library extends Backbone.View

  tagName: "section"
  className: "library"
  template: JST['library']

  initialize: ->
    @collection.on("reset", @render, this)

  render: ->
    $(@el).html(@template())
    $albums = @$(".albums")
    @collection.each(@appendAlbum)
    this

  appendAlbum: (entry) =>
    view = new Backbonetunerails.Views.LibraryAlbum(model: entry, collection: @collection)
    @$(".albums").append(view.render().el)