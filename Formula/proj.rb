class Proj < Formula
  desc "Tool for use templates to create and modify programming projects"
  homepage "https://github.com/cutehax0r/proj"

  url "https://github.com/cutehax0r/proj/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "bd60f7de3aad01da11c1e2844a855b7fc6fc84ce2d1fc54088a0d9d641f69243"
  license "MIT"

  conflicts_with "proj", because: "this formula provides a different proj executable"

  depends_on "cmake" => :build
  depends_on "go" => :build
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
