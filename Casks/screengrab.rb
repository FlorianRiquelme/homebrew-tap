cask "screengrab" do
  version "1.2.1"
  sha256 "5668f4f4b5b332bfae6fdad6eaa6455f1cff3870e0fced3ee9e22caadf854c98"

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
