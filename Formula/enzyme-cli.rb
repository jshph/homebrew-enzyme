class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/jshph/enzyme"
  version "0.5.13"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/jshph/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
    sha256 "ca050235707aaf67bc06be14edda26c208b9c4c9a6648a2ab1b4cac72b070688"
  else
    url "https://github.com/jshph/enzyme/releases/download/v#{version}/enzyme-macos-x86_64.tar.gz"
    sha256 "e159a098528b90157478387a6ec7bf05bd8ff175f100eba4c47a9277c4163563"
  end

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
