cask "berth" do
  version "1.0.0"
  sha256 "5f186796dd042af95b0e0cbea1d772a659eb8e63e949e48154d70230c77dcd05"

  url "https://github.com/basheer421/Berth/releases/download/v#{version}/Berth.app.zip"
  name "Berth"
  desc "Docker runtime manager for macOS, powered by Colima"
  homepage "https://github.com/basheer421/Berth"

  depends_on macos: :monterey

  app "Berth.app"

  zap trash: [
    "~/Library/Caches/io.g137.Berth",
    "~/Library/Preferences/io.g137.Berth.plist",
  ]
end
