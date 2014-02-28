{View} = require 'atom'

module.exports =

class VimCommandModeInputView extends View
  @content: ->
    @div class: 'command-mode-input', =>
      @input outlet: "input", class: 'command-mode-input-field'

  initialize: (@motion, opts = {})->
    if opts.class?
      @input.addClass opts.class

    unless atom.workspaceView?
      # We're in test mode. Don't append to anything, just initialize.
      @input.focus()
      @handleEvents()
      return

    statusBar = atom.workspaceView.find('.status-bar')

    if statusBar.length > 0
      @.insertBefore(statusBar)
    else
      pane.append(@)

    @input.focus()
    @handleEvents()

  handleEvents: ->
    @on 'vim-mode:command-mode-input-confirm', @confirm
    @on 'core:cancel', @remove
    @on 'core:focus-next', @remove
    @on 'core:focus-previous', @remove

  confirm: =>
    @value = @input[0].value
    @motion.confirm(@)
    @remove()

  remove: =>
    atom.workspaceView.focus() if atom.workspaceView?
    super()