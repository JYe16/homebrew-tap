cask "mdeditor" do
  version "1.1.2"
  sha256 "8aa84eb747c4f1c0cf9353a2b57fa1ba11ab4e752c96651c1d588caa9a27d5a8"

  url "https://github.com/JYe16/mdeditor/releases/download/v#{version}/MDEditor-#{version}.dmg"
  name "MDEditor"
  desc "Markdown editor with live preview"
  homepage "https://github.com/JYe16/mdeditor"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "MDEditor.app"

  # The app is ad-hoc signed but not notarized: clear the download quarantine flag so it opens normally.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "MDEditor.app"], base: :appdir, chdir: "."
  end

  zap trash: [
    "~/Library/Preferences/com.jackieye.MDEditor.plist",
    "~/Library/Saved Application State/com.jackieye.MDEditor.savedState",
  ]
end
