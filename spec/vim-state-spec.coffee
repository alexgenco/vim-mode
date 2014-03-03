{$, WorkspaceView} = require "atom"
{VimState} = require "../lib/vim-state"

describe "VimMode", ->
  [editorView, vimState] = []

  beforeEach ->
    atom.workspaceView = new WorkspaceView()
    atom.workspaceView.openSync()
    atom.workspaceView.simulateDomAttachment()
    atom.packages.activatePackage("vim-mode")

    editorView = atom.workspaceView.getActiveView()
    vimState = new VimState(editorView)

  it "defaults to normal-mode", ->
    expect(editorView).toHaveClass("normal-mode")

  it "intercepts text input sent to the editor view", ->
    spyOn(vimState, "handleInput")
    typingEvent = $.Event("keydown", keyCode: 64)
    editorView.trigger(typingEvent)
    expect(vimState.handleInput).toHaveBeenCalledWith(64)

  describe "activateNormalMode", ->
    it "adds .normal-mode", ->
      vimState.activateNormalMode()
      expect(editorView).toHaveClass("normal-mode")

  describe "activateInsertMode", ->
    it "removes .normal-mode and adds .insert-mode", ->
      vimState.activateInsertMode()
      expect(editorView).not.toHaveClass("normal-mode")
      expect(editorView).toHaveClass("insert-mode")
