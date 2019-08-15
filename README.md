# theme-set package

A simple package for managing a light and dark theme. Describe each theme with
the appropriate key/value pairs, and then either activate a specific theme or
toggle between the themes.

![A screenshot of the package](https://github.com/evan-evone/atom-theme-set/blob/v0.2.0/assets/example.gif?raw=true)

## Customization
All customization is done through the `config.cson` file. There are two objects
that allow you to customize the themes used by `theme-set`: `lightTheme` and
`darkTheme`. These can be edited as follows:

```cson
darkTheme:
  "key1": "val-1A"
  "key2": "val-2A"
  "key3": "val-3A"
  ...
lightTheme:
  "key1": "val-1B"
  "key2": "val-2B"
  "key3": "val-3B"
  ...
```

- The keys (`key1`, `key2`, `key3`, ...) should be strings that can be called
  by `atom.config.set` (i.e. `core.themes` etc.).
- The values (`val-1A`, `val-2B`, etc.) can be any valid value for a given key.
  The type and content of these values will vary based on the key.

By default, these themes are:

```cson
darkTheme:
  "core.themes": [
    "one-dark-ui"
    "one-dark-syntax"
  ]
lightTheme:
  "core.themes": [
    "one-light-ui"
    "solarized-light-syntax"
  ]
```
