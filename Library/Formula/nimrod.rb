class Nimrod < Formula
  desc "Statically typed, imperative programming language"
  homepage "http://nim-lang.org/"
  url "http://nim-lang.org/download/nim-0.11.2.tar.xz"
  sha1 "2693022e35e31196d14ec2d1fbf11a90abac34cf"
  head "https://github.com/Araq/Nim.git", :branch => "devel"

  bottle do
    cellar :any
    sha256 "11c12362d33127b9625020f76026fd5c4d98816b0fab9e2954243183b4b8e7b1" => :yosemite
    sha256 "99f5155891465502cb7643fe98a02756c25a3b46352c69145f10fe4875bb707f" => :mavericks
    sha256 "c2765cefc4bec4f25620347e0448cdbfa64e223203f1e3f44590326009172712" => :mountain_lion
  end

  def install
    system "/bin/sh", "build.sh"
    system "/bin/sh", "install.sh", prefix

    bin.install_symlink prefix/"nim/bin/nim"
    bin.install_symlink prefix/"nim/bin/nim" => "nimrod"
  end

  test do
    (testpath/"hello.nim").write <<-EOS.undent
      echo("hello")
    EOS
    assert_equal "hello", shell_output("#{bin}/nim compile --verbosity:0 --run #{testpath}/hello.nim").chomp
  end
end
