window.Backbonetunerails =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Backbonetunerails.Routers.Router()
    Backbone.history.start(pushState: true)

$(document).ready ->
  Backbonetunerails.initialize()