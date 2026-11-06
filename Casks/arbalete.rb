cask "arbalete" do
  version "0.1.0"
  sha256 "21b484c9bde4d65a23c890d2afa1fe75c23f56281d1b9968a550041e037c4daa"

  url "https://github.com/amenophis/arbalete/releases/download/v#{version}/Arbalete-#{version}-arm64.dmg"
  name "Arbalete"
  desc "Browser inspired by Arc, on Chromium"
  homepage "https://github.com/amenophis/arbalete"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Arbalete.app"

  zap trash: [
    "~/Library/Application Support/Arbalete",
    "~/Library/Caches/Arbalete",
    "~/Library/Preferences/io.github.amenophis.arbalete.plist",
  ]

  caveats <<~EOS
    Arbalete is not notarized by Apple yet, so macOS blocks its first launch.
    Open it once from System Settings > Privacy & Security > Open Anyway, or run:
      xattr -dr com.apple.quarantine /Applications/Arbalete.app
  EOS
end
