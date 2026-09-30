cask "clashbar" do
  version "0.3.4"

  on_arm do
    sha256 "2b4f343f1a93f641b4c52efa09f9a2a189bb843619fba9ea652a7f126ffe3fc7"

    url "https://github.com/Sitoi/ClashBar/releases/download/v#{version}/ClashBar-#{version}-apple-silicon.dmg"
  end
  on_intel do
    sha256 "b410987cb6f923264810787ca3f5ae5a408269eef4c6934a85857ff3740989e2"

    url "https://github.com/Sitoi/ClashBar/releases/download/v#{version}/ClashBar-#{version}-intel.dmg"
  end

  name "ClashBar"
  desc "Clash client"
  homepage "https://github.com/Sitoi/ClashBar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "ClashBar.app"

  zap trash: [
    "~/Library/Application Support/ClashBar",
    "~/Library/Caches/com.sitoi.ClashBar",
    "~/Library/Preferences/com.sitoi.ClashBar.plist",
  ]
end
