@Post =
  
  init: -> @bind()

  bind: ->
    $("[data-name=new-post-form]").on 'ajax:complete', -> @reset()

$ ->
  Post.init()