cask "arbalete" do
  version "0.4.3"
  sha256 "e8e0500dc983b61dd39fbd50a6e644f63c2609f8003a7ec2056cc3c27d01c2f2"

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
