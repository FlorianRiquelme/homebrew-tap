cask "screengrab" do
  version "1.2.0"
  sha256 "fa87bcd3ede73a9de2c382fe3dc668d8221f3d9d57ef2b08b5ebcf2f8df86849"

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
