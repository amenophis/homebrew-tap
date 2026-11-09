cask "arbalete" do
  version "0.3.0"
  sha256 "a574cf24a32003d0444e094d13cd70bd808cd0e31930dc697e7fd784ce2faec0"

  url "https://github.com/amenophis/arbalete/releases/download/v#{version}/Arbalete-#{version}-arm64.dmg"
  name "Arbalete"
  desc "Browser inspired by Arc, on Chromium"
  homepage "https://arbalete.co"

  # The app updates itself (Sparkle): brew upgrade leaves it to it.
  auto_updates true

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Arbalete.app"

  # Not notarized yet: macOS would block the first launch of what Homebrew downloaded. Installing
  # from this tap already trusts it, so the app opens at once.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Arbalete.app"]
  end

  zap trash: [
    "~/Library/Application Support/Arbalete",
    "~/Library/Caches/Arbalete",
    "~/Library/Preferences/io.github.amenophis.arbalete.plist",
  ]
end
