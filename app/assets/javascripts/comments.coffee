#@Comment =
#  
#  init: -> @bind()
#
#  bind: ->
#    $("#new_comment").on 'ajax:complete', -> @reset()
#
#$ ->
#  Comment.init()

#$(document).ready ->
#
#  $("#new_comment").on("ajax:success", (e, data, status, xhr) ->
#    $("#new_comment p").remove
#    $("#comment_comment").val ''
#  ).on "ajax:error", (e, xhr, status, error) ->
#    $("#new_comment p").remove
#    $("#new_comment").prepend "<p class=\"error\">Can't post nothing!</p>"
#
#  $("a.delete-comment[data-remote]").on "ajax:success", (e, data, status, xhr) ->
#    console.log "Comment... possibly post deleted"
