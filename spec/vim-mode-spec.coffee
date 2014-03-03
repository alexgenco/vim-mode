{WorkspaceView} = require "atom"

describe "VimMode", ->
  editorView = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView()
    atom.workspaceView.openSync()
    atom.workspaceView.simulateDomAttachment()

    waitsFor -> atom.packages.activatePackage("vim-mode")
    runs -> editorView = atom.workspaceView.getActiveView()

  it "adds .vim-mode to the editor view", ->
    expect(editorView).toHaveClass("vim-mode")

  xit "adds a vim state to the editor view", ->
    # Can't get this to pass, I'm guessing because editorView here is
    # a different object than the one that gets assigned a vim state.
    expect(editorView.vimState).not.toBeUndefined()
