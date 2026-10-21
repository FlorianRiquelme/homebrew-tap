cask "screengrab" do
  version "1.3.0"
  sha256 "eb3a33d39400b6743ca0fe3319dcd5f5b1542abdab80bf84c274f0cdc3f54570"

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
