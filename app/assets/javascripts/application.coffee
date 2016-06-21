#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require sync
#= require comments
#= require posts

#= require_tree .

class Sync.Comment extends Sync.View

	beforeInsert: ($el) ->
		$el.hide()
		@insert($el)

	aftertInsert: ->
		@$el.fadeIn(250)