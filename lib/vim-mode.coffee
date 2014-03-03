{VimState} = require "./vim-state"

module.exports =
  activate: (state) ->
    atom.workspaceView.eachEditorView (editorView) ->
      editorView.addClass("vim-mode")
      editorView.vimState = new VimState(editorView)
