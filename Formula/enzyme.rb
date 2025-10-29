class Enzyme < Formula
  desc "AI-powered knowledge management for markdown vaults (Obsidian, Logseq)"
  homepage "https://github.com/jshph/enzyme-python"
  url "https://github.com/jshph/enzyme-python/releases/download/v0.15.8/enzyme-0.15.8-macos-arm64.tar.gz"
  sha256 "de428d1ea857acd28b861c5beb50e41eb905d9fe4b37df74da206f87c61dd7f6"
  version "0.15.8"
  license "MIT"

  # Only supports macOS ARM64 for now
  depends_on :macos
  depends_on arch: :arm64

  def install
    # The tarball extracts to enzyme-coreml/ directory
    libexec.install Dir["*"]

    # Create wrapper scripts that call the binaries
    (bin/"enzyme").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/enzyme-coreml/enzyme" "$@"
    EOS

    (bin/"enzyme-mcp").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/enzyme-coreml/enzyme-mcp" "$@"
    EOS

    chmod 0755, bin/"enzyme"
    chmod 0755, bin/"enzyme-mcp"
  end

  test do
    system "#{bin}/enzyme", "--help"
  end
end
