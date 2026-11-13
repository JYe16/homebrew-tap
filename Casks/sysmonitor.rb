cask "sysmonitor" do
  version "1.3"
  sha256 "300a6a3f210df1153dcc3189efa46eec1cdfce03429bf69163af2d042f7ee45f"

  url "https://github.com/JYe16/sysmonitor/releases/download/v#{version}/SysMonitor-#{version}.dmg"
  name "SysMonitor"
  desc "Menu-bar monitor for CPU, GPU, temperature, memory and network"
  homepage "https://github.com/JYe16/sysmonitor"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "SysMonitor.app"

  # The app is ad-hoc signed but not notarized: clear the download quarantine flag so it opens normally.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "SysMonitor.app"], base: :appdir, chdir: "."
  end

  uninstall quit: "local.sysmonitor"

  zap trash: "~/Library/Preferences/local.sysmonitor.plist"
end
