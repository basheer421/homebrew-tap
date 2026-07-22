class CcBrain < Formula
  desc "Cross-session awareness for Claude Code — living Markdown summaries"
  homepage "https://github.com/basheer421/cc-brain"
  url "https://github.com/basheer421/cc-brain/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f634f4c89c4e5343d60168065947bfa72e5014345a3970c36fb8b37aa5410658"
  license "MIT"

  depends_on :macos

  def install
    system "bash", "build_app.sh"
    prefix.install "dist/CC Brain.app"
  end

  def post_install
    ln_sf prefix/"CC Brain.app", "/Applications/CC Brain.app"
  end

  def caveats
    <<~EOS
      CC Brain requires Python 3.10+ and these packages:
        pip3 install rumps watchdog requests Pillow

      You also need an OpenRouter API key:
        https://openrouter.ai/keys

      Configure at ~/.cc-brain/config.json
    EOS
  end

  test do
    assert_predicate prefix/"CC Brain.app", :exist?
  end
end
