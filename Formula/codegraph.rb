class Codegraph < Formula
  desc "Pre-indexed code knowledge graph for coding agents"
  homepage "https://github.com/colbymchenry/codegraph"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.1/codegraph-darwin-arm64.tar.gz"
      sha256 "7a08cf8cf26cdf9e4ba5f8b2a36bb9c039b8966a6cb30b5e27c4b82074abf499"
    else
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.1/codegraph-darwin-x64.tar.gz"
      sha256 "403b99a29b91adc3eb78a625a653c531f315de82ae80d32000eb60e50d385275"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.1/codegraph-linux-arm64.tar.gz"
      sha256 "3e31bfd645416ab4e34516a9fe444a907132b3527b18889c877148219cdcc966"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.1/codegraph-linux-x64.tar.gz"
      sha256 "767c112faf8175a3dd768defc1688203fef459de29c4b52c02e16a472b8f5d26"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/codegraph"
  end

  test do
    assert_match "1.6.1", shell_output("#{bin}/codegraph --version")
  end
end
