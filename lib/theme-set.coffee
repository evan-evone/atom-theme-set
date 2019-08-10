ThemeSetView = require './theme-set-view'
{CompositeDisposable} = require 'atom'

module.exports = ThemeSet =
  themeSetView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @themeSetView = new ThemeSetView(state.themeSetViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @themeSetView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'theme-set:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @themeSetView.destroy()

  serialize: ->
    themeSetViewState: @themeSetView.serialize()

  toggle: ->
    console.log 'ThemeSet was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
