class Backbonetunerails.Router extends Backbone.Router
  routes:
    '': 'index'
    'blank': 'blank'

  index: ->
    $container = $("#container")
    $container.empty()
    $container.text "index"

  blank: ->
    $container = $("#container")
    $container.empty()
    $container.text "blank"