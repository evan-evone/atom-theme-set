{CompositeDisposable} = require 'atom'

module.exports =
ThemeSet =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system
    # can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register the "activate" and "toggle" commands
    @subscriptions.add atom.commands.add 'atom-workspace',
      'theme-set:activate-dark-theme': => @activateDarkTheme()
    @subscriptions.add atom.commands.add 'atom-workspace',
      'theme-set:activate-light-theme': => @activateLightTheme()
    @subscriptions.add atom.commands.add 'atom-workspace',
      'theme-set:toggle-theme': => @toggleTheme()

  deactivate: ->
    @subscriptions.dispose()

  activateDarkTheme: ->
    console.log('Activating dark theme')
    darkTheme = atom.config.get("theme-set.darkTheme")
    atom.config.set("core.themes", ["one-dark-ui", "one-dark-syntax"])
    atom.config.set("markdown-preview-enhanced.codeBlockTheme", "one-dark.css")
    atom.config.set("markdown-preview-enhanced.previewTheme", "one-dark.css")
    atom.config.set("theme-set.activeTheme", "dark")

  activateLightTheme: ->
    console.log('Activating light theme')
    atom.config.set("core.themes", ["one-light-ui", "solarized-light-syntax"])
    atom.config.set("markdown-preview-enhanced.codeBlockTheme", "solarized-light.css")
    atom.config.set("markdown-preview-enhanced.previewTheme", "solarized-light.css")
    atom.config.set("theme-set.activeTheme", "light")

  toggleTheme: ->
    workspaceElement = atom.views.getView(atom.workspace)
    activeTheme = atom.config.get("theme-set.activeTheme")
    console.log("Active Theme: #{activeTheme}")
    if activeTheme == "dark"
      atom.commands.dispatch workspaceElement, "theme-set:activate-light-theme"
    else if activeTheme == "light"
      atom.commands.dispatch workspaceElement, "theme-set:activate-dark-theme"
    else
      atom.commands.dispatch workspaceElement, "theme-set:activate-dark-theme"
