# typed: true

class ProjAT0010 < Formula
  desc "Tool for use templates to create and modify programming projects"
  homepage "https://github.com/cutehax0r/proj"

  url "https://github.com/cutehax0r/proj/archive/refs/tags/v0.0.10.tar.gz"
  sha256 "0af4eb858c208e0b1c965b74d8e1e05250d77d548a2df7ce14a606a6cf0d6f93"
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
