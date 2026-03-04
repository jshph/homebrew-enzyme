class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/jshph/enzyme"
  version "0.1.1"
  license "MIT"

  url "https://github.com/jshph/enzyme/releases/download/v#{version}/enzyme-aarch64-apple-darwin.tar.gz"
  sha256 "761555a539ea11ced42e5b2cb2fb51d81d265641903b29bbdcf7808007ea731e"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "enzyme"
  end

  def post_install
    system "#{bin}/enzyme", "setup"
  end

  def caveats
    <<~EOS
      Enzyme installed successfully!

      The embedding model (~52 MB) was downloaded to ~/.enzyme/models/.

      Next steps:
        cd /path/to/your/vault
        enzyme init

      Setup guide: https://enzyme.garden/setup
    EOS
  end

  test do
    system "#{bin}/enzyme", "--help"
  end
end
