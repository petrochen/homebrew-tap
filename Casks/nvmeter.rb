cask "nvmeter" do
  version "0.10.0"
  sha256 "3bab36c91d2b5386a2b3d2bcbee95f11aa34dcf73ad45f78a1ecba563709ab70"

  url "https://github.com/petrochen/nvmeter/releases/download/v#{version}/NVMeter-#{version}.zip"
  name "NVMeter"
  desc "Monitor for NVMe SSDs and USB4/Thunderbolt enclosures: SMART, temperatures, speed tests"
  homepage "https://github.com/petrochen/nvmeter"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "NVMeter.app"

  uninstall quit: "dev.nvmeter.app"

  # History, SMART snapshots, speed test results and connect checks live in Application Support.
  zap trash: [
    "~/Library/Application Support/NVMeter",
    "~/Library/Caches/dev.nvmeter.app",
    "~/Library/HTTPStorages/dev.nvmeter.app",
    "~/Library/Preferences/dev.nvmeter.app.plist",
    "~/Library/Saved Application State/dev.nvmeter.app.savedState",
  ]

  caveats <<~EOS
    NVMeter lives in the menu bar and offers to start at login on first launch: connect checks
    and history are only recorded while it runs.

    For AI agents (MCP server):
      claude mcp add --scope user nvmeter -- #{appdir}/NVMeter.app/Contents/MacOS/NVMeter --mcp
  EOS
end
