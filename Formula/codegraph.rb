class Codegraph < Formula
  desc "Pre-indexed code knowledge graph for coding agents"
  homepage "https://github.com/colbymchenry/codegraph"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.0/codegraph-darwin-arm64.tar.gz"
      sha256 "1c73033512d55f67be04717e81532e8beaf7be6fb8531f51a179fa23064ad480"
    else
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.0/codegraph-darwin-x64.tar.gz"
      sha256 "cb86a2b62ee676b62a56bf8423600e7d867e752e57f323cdc98c0f6236efd908"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.0/codegraph-linux-arm64.tar.gz"
      sha256 "6dc935a7b8f1a61e688a578b98ea34680eb2e36d7b91db079d64f4011f1a668f"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.0/codegraph-linux-x64.tar.gz"
      sha256 "de3391f79ed42622d937e6cd5b7642a7ea8bb7d1473607e80b879ba73ef216b0"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/codegraph"
  end

  test do
    assert_match "1.6.0", shell_output("#{bin}/codegraph --version")
  end
end
