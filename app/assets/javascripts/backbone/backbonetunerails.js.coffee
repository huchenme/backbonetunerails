#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Backbonetunerails =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  initialize: ->
    new Backbonetunerails.Router()
    Backbone.history.start(pushState: true)

$(document).ready ->
  Backbonetunerails.initialize()