class Codegraph < Formula
  desc "Pre-indexed code knowledge graph for coding agents"
  homepage "https://github.com/colbymchenry/codegraph"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.4/codegraph-darwin-arm64.tar.gz"
      sha256 "daa9142732eefed5b6d187aa82a2ca9c4f3ebce10d394fb79cf6c45b367618cc"
    else
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.4/codegraph-darwin-x64.tar.gz"
      sha256 "f16a56e5df375a1652ed717ce8bd0fb466725e64b52a53dc0070d6e8c281363c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.4/codegraph-linux-arm64.tar.gz"
      sha256 "e9cd2bebb29ce6aa83b4489755f76a36f3e22658beac5ebef023b874be7cfce1"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/colbymchenry/codegraph/releases/download/v1.6.4/codegraph-linux-x64.tar.gz"
      sha256 "8477f3841cba6ac8c45847d42eb5254f1f2d7fbc3045baf333e1cbe92267022d"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/codegraph"
  end

  test do
    assert_match "1.6.4", shell_output("#{bin}/codegraph --version")
  end
end
