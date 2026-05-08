class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/jshph/enzyme"
  version "0.5.9"
  license "MIT"

  url "https://github.com/jshph/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
  sha256 "d8baabc1975d5604a45f3c1e7dd7524d61fe658111443deb9605bfec73224c73"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "enzyme"
  end

  def caveats
    <<~EOS
      Enzyme installed successfully!

      Initialize your vault:
        cd /path/to/your/vault
        enzyme init

      Setup guide: https://enzyme.garden/setup
    EOS
  end

  test do
    system "#{bin}/enzyme", "--help"
  end
end
