cask "mdeditor" do
  version "1.1.0"
  sha256 "d6e9766d350f35bfda630a2f10945f74198b60394b95867123bcac051fa006f5"

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
