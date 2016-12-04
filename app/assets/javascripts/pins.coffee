# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# http://stackoverflow.com/questions/18770517/rails-4-how-to-use-document-ready-with-turbo-links
# /index reflows, yey .. twice! ... ney ... :(
# no solution found ..
$(document).on "turbolinks:load", ->
  $( '#pins' ).imagesLoaded ->
    $( '#pins' ).masonry
      itemSelector: '.box'
      isFitWidth: true

# /index doesn't reflow
# $ ->
#   $( '#pins' ).imagesLoaded ->
#     $( '#pins' ).masonry
#       itemSelector: '.box'
#       isFitWidth: true
