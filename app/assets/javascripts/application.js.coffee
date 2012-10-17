#= require prism-line-highlight
# require highlight.pack

# hljs.initHighlightingOnLoad();

$(document).ready ->
  $('ul.pages li.active').parents('ul.pages').toggleClass('active')
  $('h3.accordion').click ->
    $(this).next().toggle 'slow'
    false
