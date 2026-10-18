cask "screengrab" do
  version "1.1.0"
  sha256 "1ff375ce6a06eaed011281c82ad821d6d6138bcdbc4563351173dcdcff6dd221"

  url "https://github.com/FlorianRiquelme/screengrab/releases/download/v#{version}/Screengrab-#{version}.zip"
  name "Screengrab"
  desc "Screenshots and screen recordings, made for pasting into AI agents"
  homepage "https://github.com/FlorianRiquelme/screengrab"

  depends_on macos: :tahoe

  app "Screengrab.app"

  # The app is not notarized, so Gatekeeper would refuse to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Screengrab.app"]
  end

  uninstall quit: "io.github.florianriquelme.screengrab"

  zap trash: [
    "~/Library/Caches/Screengrab",
    "~/Library/Preferences/io.github.florianriquelme.screengrab.plist",
  ]
end
