class Enzyme < Formula
  desc "AI-powered knowledge management for markdown vaults (Obsidian, Logseq)"
  homepage "https://github.com/jshph/enzyme-python"
  # Download from Railway server (private GitHub repo)
  url "https://enzyme-server-production.up.railway.app/site/download-enzyme?platform=mac-arm64"
  sha256 "de428d1ea857acd28b861c5beb50e41eb905d9fe4b37df74da206f87c61dd7f6"
  version "0.15.8"
  license "MIT"

  # Only supports macOS ARM64 for now
  depends_on :macos
  depends_on arch: :arm64

  def install
    # The tarball extracts to the root, install directly to libexec
    libexec.install Dir["*"]

    # Create wrapper scripts that call the binaries
    (bin/"enzyme").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/enzyme" "$@"
    EOS

    (bin/"enzyme-mcp").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/enzyme-mcp" "$@"
    EOS

    chmod 0755, bin/"enzyme"
    chmod 0755, bin/"enzyme-mcp"
  end

  def caveats
    <<~EOS
      🧬 Enzyme installed! Next steps:

      1. Configure MCP for Claude Code:
         claude mcp add enzyme --scope user enzyme-mcp

      2. Configure MCP for Codex (optional):
         Add to ~/.codex/config.toml:

         [mcp_servers.enzyme]
         command = "#{HOMEBREW_PREFIX}/bin/enzyme-mcp"
         args = []

      3. Launch Claude Code with Enzyme:
         cd /path/to/your/vault
         claude "/enzyme:enzyme (MCP)"

      📚 Documentation: https://github.com/jshph/enzyme-python
    EOS
  end

  test do
    system "#{bin}/enzyme", "--help"
  end
end
