class ProjAT001 < Formula
  desc "Tool for use templates to create and modify programming projects"
  homepage "https://github.com/cutehax0r/proj"

  url "https://github.com/cutehax0r/proj/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "39f70572b65ecd73c81a60e02b5fe0067cc55f08cddd5506be23d0127ccad91d"
  license "MIT"

  conflicts_with "proj", because: "this formula provides a different proj executable"

  depends_on "cmake" => :build
  depends_on "go" => :build

  def install
    system "make", "build"
    bin.install "bin/proj"
  end

  test do
    system "#{bin}/proj", "help"
  end
end

