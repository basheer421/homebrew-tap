cask "cc-brain" do
  version "1.0.0"
  sha256 "f22e4c60c70fe55e962db81b38385ba28039be74d6779ab4dfefb20d5bef53e6"

  url "https://github.com/basheer421/cc-brain/releases/download/v#{version}/CC-Brain.app.zip"
  name "CC Brain"
  desc "Cross-session awareness for Claude Code — living Markdown summaries"
  homepage "https://github.com/basheer421/cc-brain"

  depends_on macos: :monterey

  app "CC Brain.app"

  caveats <<~EOS
    CC Brain requires Python 3.10+ and these packages:
      pip3 install rumps watchdog requests Pillow

    You also need an OpenRouter API key:
      https://openrouter.ai/keys

    On first launch, run the setup:
      cd $(brew --prefix)/Caskroom/cc-brain/#{version}
      # Or configure manually at ~/.cc-brain/config.json
  EOS

  zap trash: [
    "~/.cc-brain",
  ]
end
