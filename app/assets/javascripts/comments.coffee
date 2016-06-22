class RenderSync.CommentRow extends RenderSync.View

  # Hide the comment, insert the comment, clear the form
  beforeInsert: ($el) ->
    $el.hide()
    @insert($el)

  # Fade in the comment as it's inserted
  afterInsert: ->
    $('#comment_comment').val('').focus()
    @$el.fadeIn 'slow'

  # Fade out the comment as it's deleted
  beforeRemove: -> @$el.fadeOut 'slow', => @remove()