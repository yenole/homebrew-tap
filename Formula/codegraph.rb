class Codegraph < Formula
  desc "Pre-indexed code knowledge graph for coding agents"
  homepage "https://github.com/colbymchenry/codegraph"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.2/codegraph-darwin-arm64.tar.gz"
      sha256 "d74d1bfb4060db63ec3c2b72c4e17f76c31978af3bad6ace4370d1501ac0662e"
    else
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.2/codegraph-darwin-x64.tar.gz"
      sha256 "53d1a4d1a9af31d6cec11b346df2ae792087081e13f623f583e27783c1e7f9bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.2/codegraph-linux-arm64.tar.gz"
      sha256 "c8c6be292be21d00dea26bad8b28d434731cf612fb8cc475dc10f5b3038b5b64"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.2/codegraph-linux-x64.tar.gz"
      sha256 "ef0af416092128fb1ccc723786000b7edf4a6971fe604acd08bf966e4f37b828"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/codegraph"
  end

  test do
    assert_match "1.6.2", shell_output("#{bin}/codegraph --version")
  end
end
