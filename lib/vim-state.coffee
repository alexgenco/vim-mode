class VimState
  constructor: (@editorView) ->
    @editorView.command("vim-mode:activate-normal-mode", => @activateNormalMode())
    @editorView.command("vim-mode:activate-insert-mode", => @activateInsertMode())
    @_establishInputIntercept()
    @activateNormalMode()

  activateNormalMode: ->
    @mode = "normal"
    @editorView.removeClass("insert-mode")
    @editorView.addClass("normal-mode")

  activateInsertMode: ->
    @mode = "insert"
    @editorView.removeClass("normal-mode")
    @editorView.addClass("insert-mode")

  handleInput: (keyCode) -> true

  _establishInputIntercept: ->
    @editorView.preempt("keydown", (e) => @handleInput(e.keyCode))

module.exports = {VimState}
