#= require prism-line-highlight
# require highlight.pack

# hljs.initHighlightingOnLoad();

$(document).ready ->
  $('ul.pages li.active').parent().toggleClass('active')
  $('h3.accordion').click ->
    $(this).next().toggle 'slow'
    false
