class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/jshph/enzyme"
  version "0.3.1"
  license "MIT"

  url "https://github.com/jshph/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
  sha256 "cbe647cab2a096bde40599464668f3d35205044b5ef265d57ae2b79bccc0a945"

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
