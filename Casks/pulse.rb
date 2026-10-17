cask "pulse" do
  version "1.0.0"
  sha256 "7e0d8163a6601246d4a3ea7bf7e38522daa26ed2b5c3bc3aeb2be19d5132d1f2"

  url "https://github.com/FlorianRiquelme/pulse/releases/download/v#{version}/Pulse-#{version}.zip"
  name "Pulse"
  desc "Menu bar monitor for battery runtime, CPU, memory, sensors and network"
  homepage "https://github.com/FlorianRiquelme/pulse"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Pulse.app"

  # The app is not notarized, so Gatekeeper would refuse to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Pulse.app"]
  end

  uninstall quit: "io.github.florianriquelme.pulse"

  zap trash: [
    "~/Library/Application Support/Pulse",
    "~/Library/Preferences/io.github.florianriquelme.pulse.plist",
  ]
end
