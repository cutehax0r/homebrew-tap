# typed: true

class ProjAT007 < Formula
  desc "Tool for use templates to create and modify programming projects"
  homepage "https://github.com/cutehax0r/proj"

  url "https://github.com/cutehax0r/proj/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "9c5bb82bb86970450bf28135747b569090f620896eefc367b0d9e9b3df29dd62"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "go" => :build
  depends_on "go-md2man" => :build

  keg_only :versioned_formula

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
