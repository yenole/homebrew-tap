cask "clashbar" do
  version "0.3.3"

  on_arm do
    sha256 "ff8ca07ce4ee6780fce19d620292b45b85667a92b1e12c6bffc0c213d0a4680c"

    url "https://github.com/Sitoi/ClashBar/releases/download/v#{version}/ClashBar-#{version}-apple-silicon.dmg"
  end
  on_intel do
    sha256 "181d2172a837fcecd5e7cce7c40e59c845144b25c2628d22018377e721ec6c8a"

    url "https://github.com/Sitoi/ClashBar/releases/download/v#{version}/ClashBar-#{version}-intel.dmg"
  end

  name "ClashBar"
  desc "Clash client"
  homepage "https://github.com/Sitoi/ClashBar"

  depends_on :macos

  app "ClashBar.app"

  zap trash: [
    "~/Library/Application Support/ClashBar",
    "~/Library/Caches/com.sitoi.ClashBar",
    "~/Library/Preferences/com.sitoi.ClashBar.plist",
  ]
end
