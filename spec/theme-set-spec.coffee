ThemeSet = require '../lib/theme-set'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

Array::is = (o) ->
  return true if this is o
  return false if this.length isnt o.length
  for i in [0..this.length]
    return false if this[i] isnt o[i]
  true

describe "ThemeSet", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('theme-set')

  describe "when the theme-set:activate-dark-theme event is triggered", ->
    it "sets the theme to dark mode", ->
      # start by automatically activating light theme
      atom.commands.dispatch workspaceElement, "theme-set:activate-light-theme"

      waitsForPromise ->
        activationPromise

      runs ->
        atom.commands.dispatch workspaceElement, 'theme-set:activate-dark-theme'
        darkTheme = atom.config.get("theme-set.darkTheme")
        for own key of darkTheme
          do expect(atom.config.get(key) == darkTheme[key]).toBe true

    it "sets the activeTheme string to 'dark'", ->
      # start by automatically activating light theme
      atom.commands.dispatch workspaceElement, "theme-set:activate-light-theme"

      waitsForPromise ->
        activationPromise

      runs ->
        atom.commands.dispatch workspaceElement, 'theme-set:activate-dark-theme'
        expect(atom.config.get('theme-set.activeTheme')).toBe 'dark'


  describe "when the theme-set:activate-light-theme event is triggered", ->
    it "sets the theme to light mode", ->
      # start by automatically activating dark mode
      atom.commands.dispatch workspaceElement, "theme-set:activate-dark-theme"

      waitsForPromise ->
        activationPromise

      runs ->
        atom.commands.dispatch workspaceElement, 'theme-set:activate-light-theme'
        lightTheme = atom.config.get("theme-set.lightTheme")
        for own key of lightTheme
          do expect(atom.config.get(key) == lightTheme[key]).toBe true

    it "sets the activeTheme string to 'light'", ->
      # start by automatically activating dark mode
      atom.commands.dispatch workspaceElement, "theme-set:activate-dark-theme"

      waitsForPromise ->
        activationPromise

      runs ->
        atom.commands.dispatch workspaceElement, 'theme-set:activate-light-theme'
        expect(atom.config.get("theme-set.activeTheme")).toBe "light"

  describe "when the theme-set:toggle-theme event is triggered", ->
    it "switches from light mode to dark mode", ->
      atom.commands.dispatch workspaceElement, 'theme-set:activate-light-theme'

      waitsForPromise ->
        activationPromise

      runs ->
        atom.commands.dispatch workspaceElement, 'theme-set:activate-light-theme'
        atom.commands.dispatch workspaceElement, 'theme-set:toggle-theme'
        darkTheme = atom.config.get("theme-set.darkTheme")
        for own key of darkTheme
          do expect(atom.config.get(key) == darkTheme[key]).toBe true

    it "switches from dark mode to light mode", ->
      atom.commands.dispatch workspaceElement, 'theme-set:activate-dark-theme'

      waitsForPromise ->
        activationPromise

      runs ->

        atom.commands.dispatch workspaceElement, 'theme-set:activate-dark-theme'
        atom.commands.dispatch workspaceElement, 'theme-set:toggle-theme'
        lightTheme = atom.config.get("theme-set.lightTheme")
        for own key of lightTheme
          do expect(atom.config.get(key) == lightTheme[key]).toBe true
