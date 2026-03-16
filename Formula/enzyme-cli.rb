class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/jshph/enzyme"
  version "0.3.9"
  license "MIT"

  url "https://github.com/jshph/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
  sha256 "49438b9a2bdb1bdaa2129b124c9aa2e1cafa5069d40c7c3358d69348396ba716"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "enzyme"
  end

  def caveats
    <<~EOS
      Enzyme installed successfully!

      Download the embedding model (~23 MB):
        enzyme setup

      Then initialize your vault:
        cd /path/to/your/vault
        enzyme init

      Setup guide: https://enzyme.garden/setup
    EOS
  end

  test do
    system "#{bin}/enzyme", "--help"
  end
end
