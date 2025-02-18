class Now < Formula
  desc "Your code is ready, Now run"
  homepage "https://nowrun.org"
  url "https://github.com/now-run/now.git", tag: "v0.32.0"
  license "MIT"
  head "https://github.com/now-run/now.git", branch: "main"

  depends_on "ldc" => :build
  depends_on "make" => :build

  def install
    # system "make", "release"
    # For some weird reason, calling `make release` simply won't work...
    system "bash", "-c", \
      "ldc2 source/now/*.d source/now/*/*.d source/now/*/*/*.d cli/now/cli.d \
      -od=build --oq -O2 -of dist/now"
    bin.install "dist/now" => "now"
  end

  test do
    system "dist/now", ":cmd", "print ok"
  end
end
