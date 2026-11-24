cask "arbalete" do
  version "0.8.0"
  sha256 "47185191a169ece2b74361a42fd5987efc294fcb5225362ed9e18a77f3bed38c"

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
