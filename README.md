# Homebrew tap for JYe16

## MDEditor

A native macOS Markdown editor with live preview — <https://github.com/JYe16/mdeditor>

```bash
brew tap JYe16/tap
brew trust --tap JYe16/tap     # recent Homebrew requires explicit trust for third-party taps
brew install --cask mdeditor
```

The app is ad-hoc signed but not notarized; the cask clears the download quarantine flag after installing.
Update with `brew upgrade --cask mdeditor`, remove with `brew uninstall --cask mdeditor`
(add `--zap` to also delete its preferences).
