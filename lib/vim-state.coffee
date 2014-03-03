class VimState
  constructor: (@editorView) ->
    @editorView.command("vim-mode:activate-normal-mode", => @activateNormalMode())
    @editorView.command("vim-mode:activate-insert-mode", => @activateInsertMode())
    @activateNormalMode()

  activateNormalMode: ->
    @mode = "normal"
    @editorView.removeClass("insert-mode")
    @editorView.addClass("normal-mode")

  activateInsertMode: ->
    @mode = "insert"
    @editorView.removeClass("normal-mode")
    @editorView.addClass("insert-mode")

module.exports = {VimState}
