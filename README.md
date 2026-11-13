# Homebrew tap for JYe16

```bash
brew tap JYe16/tap
brew trust --tap JYe16/tap     # recent Homebrew requires explicit trust for third-party taps
```

Both apps are ad-hoc signed but not notarized; the casks clear the download quarantine flag after installing.
Update with `brew upgrade --cask <name>`, remove with `brew uninstall --cask <name>`
(add `--zap` to also delete the app's preferences).

## MDEditor

A native macOS Markdown editor with live preview — <https://github.com/JYe16/mdeditor>

```bash
brew install --cask mdeditor
```

## SysMonitor

A menu-bar system monitor for macOS: CPU, GPU, temperature, memory and network — <https://github.com/JYe16/sysmonitor>

```bash
brew install --cask sysmonitor
```
