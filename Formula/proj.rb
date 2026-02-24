class Proj < Formula
  desc "A tool for use templates to create and modify programming projects"
  homepage "https://github.com/cutehax0r/proj"
  license "MIT"

  url "https://github.com/cutehax0r/proj/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "d0954076faea5ad35174e6873d13a2e06fe3126b3fad822b1247f0cd8c48aab6"

  conflicts_with "proj", because: "This formula provides a different proj executable"

  depends_on "go" => :build
  depends_on "cmake" => :build
  depends_on "go-md2man" => :build

  def install
    system "make", "build"
    bin.install "bin/proj"

    system "make", "man"
    man1.install Dir[buildpath/"bin/man/*.1"]
    man5.install Dir[buildpath/"bin/man/*.5"]
    man7.install Dir[buildpath/"bin/man/*.7"]
  end

  test do
    system "#{bin}/proj", "help"
  end
end
