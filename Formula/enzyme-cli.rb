class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/jshph/enzyme"
  version "0.1.2"
  license "MIT"

  url "https://github.com/jshph/enzyme/releases/download/v#{version}/enzyme-aarch64-apple-darwin.tar.gz"
  sha256 "ba5ac489e4cdf7c367eb150966617435b18172f637deaa42a9af6dd08a43e713"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "enzyme"
  end

  def caveats
    <<~EOS
      Enzyme installed successfully!

      Download the embedding model (~52 MB):
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
