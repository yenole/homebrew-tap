class Codegraph < Formula
  desc "Pre-indexed code knowledge graph for coding agents"
  homepage "https://github.com/colbymchenry/codegraph"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.5/codegraph-darwin-arm64.tar.gz"
      sha256 "a68d71e1fd9f925b7c319a6c81cf473a28717975dccf0a3ee6d80572ca275fef"
    else
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.5/codegraph-darwin-x64.tar.gz"
      sha256 "7f5d6f8bd190687d368052ba469fc9d6b7514338d2306ec435ac5e27ec2c1d3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.5/codegraph-linux-arm64.tar.gz"
      sha256 "e8835b97ef8b1b95c06ef15682d6a7c3465350fefc9d3a447c2a52da1f05247f"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.5/codegraph-linux-x64.tar.gz"
      sha256 "fc217463ca176eb87247a8506736b9593049513a9bd4e29feffda11d726b3e50"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/codegraph"
  end

  test do
    assert_match "1.6.5", shell_output("#{bin}/codegraph --version")
  end
end
