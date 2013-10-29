#= require sublimevideo
#= require prism-line-highlight
#= require turbolinks
#= require google-analytics-turbolinks

$(window).bind 'page:change', ->
  SublimeVideo.documentReady()
  SublimeVideo.prepareVideoPlayers()
  SublimeVideo.hightlightCode()

SublimeVideo.prepareVideoPlayers = ->
  sublime.ready ->
    $('.sublime').each (index, el) ->
      sublime.prepare el

  sublime.load()

SublimeVideo.hightlightCode = ->
  Prism.highlightAll()
