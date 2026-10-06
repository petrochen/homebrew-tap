class AudioPriority < Formula
  desc "Menu bar app that keeps the macOS default microphone and output on the best available device"
  homepage "https://github.com/petrochen/audio-input-priority"
  url "https://github.com/petrochen/audio-input-priority/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "19d21a99e9e1cbf9ffca3e15e9487f259671f22541b493e9d23bac1dfe413c21"
  license "MIT"
  head "https://github.com/petrochen/audio-input-priority.git", branch: "main"

  depends_on :macos => :ventura

  def install
    system "make", "app", "APP=#{buildpath}/AudioPriority.app"
    prefix.install "AudioPriority.app"
    bin.install_symlink prefix/"AudioPriority.app/Contents/MacOS/audio-input-priority" => "audio-priority"
  end

  def caveats
    <<~EOS
      Start it now and at every login:
        audio-priority --register
      Stop and disable start at login:
        audio-priority --unregister
      The app lives in #{opt_prefix}/AudioPriority.app (menu bar only, no Dock icon).
    EOS
  end

  test do
    assert_match "input:", shell_output("#{bin}/audio-priority --list")
  end
end
