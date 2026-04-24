class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/jshph/enzyme"
  version "0.5.2"
  license "MIT"

  url "https://github.com/jshph/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
  sha256 "773cfd7e4e5494b51087d750ee1803cd1abdb277825f2af369bf2656c4074945"

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
