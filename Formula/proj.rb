# typed: true

class Proj < Formula
  desc "Tool for use templates to create and modify programming projects"
  homepage "https://github.com/cutehax0r/proj"

  url "https://github.com/cutehax0r/proj/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "79390ea5cd05c23617ee9476117760336a63855993e1e071bb01567f5a57fc58"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "go" => :build
  depends_on "go-md2man" => :build

  conflicts_with "proj", because: "this formula provides a different proj executable"

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
