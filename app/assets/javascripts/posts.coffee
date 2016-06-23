class RenderSync.PostRow extends RenderSync.View

  # Hide the post, insert the post
  beforeInsert: ($el) ->
    $el.hide()
    @insert($el)

  # Clear the form, fade in the post as it's inserted
  afterInsert: ->
    $('#post_title, #post_content, #post_image').val ''
    @$el.fadeIn 'slow'

  # Fade out the comment as it's deleted
  beforeRemove: -> @$el.fadeOut 'slow', => @remove()
