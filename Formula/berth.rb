class Berth < Formula
  desc "Docker runtime manager for macOS, powered by Colima"
  homepage "https://github.com/basheer421/Berth"
  url "https://github.com/basheer421/Berth/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "43d1db36136c3ce918dddc239c93dc5f27ed4842523100fd60fba975e44ac64f"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["14.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/Berth"

    app = prefix/"Berth.app/Contents"
    (app/"MacOS").mkpath
    (app/"Resources").mkpath
    cp bin/"Berth", app/"MacOS/Berth"
    cp "Info.plist", app/"Info.plist"
    cp "Berth.icns", app/"Resources/Berth.icns"
  end

  def caveats
    <<~EOS
      Berth.app has been built at:
        #{prefix}/Berth.app

      To add it to your Applications folder:
        ln -sf #{prefix}/Berth.app /Applications/Berth.app

      First launch: right-click → Open to bypass Gatekeeper.

      Requires Colima:
        brew install colima docker
    EOS
  end

  test do
    assert_match "Berth", shell_output("#{bin}/Berth --help 2>&1", 1)
  end
end
