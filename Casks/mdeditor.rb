cask "mdeditor" do
  version "1.0.1"
  sha256 "e291afce2c6b411c43209c5017a242ef702a6332eae76734c5265ed5e4a0f82e"

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
