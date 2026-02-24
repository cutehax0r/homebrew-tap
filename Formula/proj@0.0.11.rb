# typed: true

class ProjAT0011 < Formula
  desc "Tool for use templates to create and modify programming projects"
  homepage "https://github.com/cutehax0r/proj"

  url "https://github.com/cutehax0r/proj/archive/refs/tags/v0.0.11.tar.gz"
  sha256 "ea13cfb9a178e844f896277c8ed9718665baa562c6fee077d391270516ba8e53"
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
