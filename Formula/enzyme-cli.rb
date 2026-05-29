class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/jshph/enzyme"
  version "0.5.14"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/jshph/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
    sha256 "7e3b899dc735d62501e85fbfb6567005cad874cf43213a6eb611009090db2659"
  else
    url "https://github.com/jshph/enzyme/releases/download/v#{version}/enzyme-macos-x86_64.tar.gz"
    sha256 "24af2d76f0b77a8b32a1a147dd6b9dcd7bdc05739c65d34dacc24135694f2952"
  end

  def install
    bin.install "enzyme"
  end

  def caveats
    <<~EOS
      Enzyme installed successfully!

      Install agent instructions from your vault:
        cd /path/to/your/vault
        enzyme install codex      # Codex / Pi / generic .agents
        enzyme install claude     # Claude Code
        enzyme install hermes     # Hermes
        enzyme install openclaw   # OpenClaw

      Then ask your agent: Use Enzyme to inspect and initialize this vault.
      Terminal-only setup: enzyme scan --write-config && enzyme init

      Setup guide: https://enzyme.garden/setup
    EOS
  end

  test do
    system "#{bin}/enzyme", "--help"
  end
end
