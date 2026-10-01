cask "clashbar" do
  version "0.3.6"

  on_arm do
    sha256 "f25bd38eca4992292535675458a1260c8a5af32b5d7ffd83f3c78869fa48cc19"

    url "https://github.com/Sitoi/ClashBar/releases/download/v#{version}/ClashBar-#{version}-apple-silicon.dmg"
  end
  on_intel do
    sha256 "f2ab4eaf1720c418e18132ef2d6b0dc5417b89ca2165251a201a7e46f3a57716"

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
