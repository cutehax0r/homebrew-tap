# typed: true

class ProjAT009 < Formula
  desc "Tool for use templates to create and modify programming projects"
  homepage "https://github.com/cutehax0r/proj"

  url "https://github.com/cutehax0r/proj/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "9dbccae325f406e6edbb97c57f66dd909fb332cc9e48f298c705f61c108ba505"
  license "MIT"

  keg_only :versioned_formula
  depends_on "cmake" => :build
  depends_on "go" => :build
  depends_on "go-md2man" => :build


  def install
    system "make", "build"
    bin.install "bin/proj"

    system "make", "man"
    man1.install Dir[buildpath / "bin/man/*.1"]
    man5.install Dir[buildpath / "bin/man/*.5"]
    man7.install Dir[buildpath / "bin/man/*.7"]
  end

  test do
    system "#{bin}/proj", "help"
  end
end
