class EnzymeCli < Formula
  desc "Compiles your content into a concept graph"
  homepage "https://github.com/jshph/enzyme"
  version "0.5.0"
  license "MIT"

  url "https://github.com/jshph/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
  sha256 "bbd18f51e97fbfae6969f574fdf8d8b102ec5095ec2850b8e896abe706ff417c"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "enzyme"
  end

  def caveats
    <<~EOS
      Enzyme installed successfully!

      Download the embedding model (~31 MB):
        enzyme setup

      Then compile your concept graph:
        cd /path/to/your/content
        enzyme init

      Setup guide: https://enzyme.garden/setup
    EOS
  end

  test do
    system "#{bin}/enzyme", "--help"
  end
end
