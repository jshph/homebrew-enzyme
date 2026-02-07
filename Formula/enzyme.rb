class Enzyme < Formula
  desc "AI-powered knowledge management for markdown vaults (Obsidian, Logseq)"
  homepage "https://github.com/jshph/enzyme-python"
  version "0.25.1"
  license "MIT"

  # Download from Railway proxy server (enzyme-python repo is private)
  # Version parameter ensures we always get the exact version matching the SHA256
  url "https://enzyme-server-production.up.railway.app/site/download-enzyme?platform=mac-arm64&version=#{version}"
  sha256 "f29f12b642834061999592c1758c8326ae6025dc2729b97907224ca57dd583ab"

  # Only supports macOS ARM64 for now
  depends_on :macos
  depends_on arch: :arm64

  # Note: Homebrew may show "Failed to fix install linkage" warnings during install.
  # This is expected with PyInstaller-bundled binaries and can be safely ignored.
  # The binaries work correctly - they use @rpath which doesn't need rewriting.

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
      🧬 Enzyme installed successfully!

      Note: You may have seen "Failed to fix install linkage" warnings above.
      These can be safely ignored - the binaries work correctly.

      Next steps:

      1. Initialize your vault:
         cd /path/to/your/vault
         enzyme init

      2. Configure MCP for Claude Code:
         claude mcp add enzyme --scope user enzyme-mcp

      📚 Full setup guide: https://enzyme.garden/setup
    EOS
  end

  test do
    system "#{bin}/enzyme", "--help"
  end
end
