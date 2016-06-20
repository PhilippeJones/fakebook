$(document).ready ->
  $("#new_comment").on("ajax:success", (e, data, status, xhr) ->
    $("#new_comment").append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_article").append "<p>ERROR</p>"

  $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    alert "The comment was deleted."