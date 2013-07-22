class Backbonetunerails.Views.Album extends Backbone.View

  tagName: "li"
  className: "album"
  template: JST['album']

  initialize: ->
    @model.on("change", @render, this)

  render: ->
    $(@el).html(@template(@model.toJSON()))
    this