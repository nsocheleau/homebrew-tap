class V8316 < Formula
  desc "Google's open source JavaScript engine"
  homepage "https://code.google.com/p/v8/"
  url "https://github.com/v8/v8-git-mirror/archive/3.16.14.7.tar.gz"
  version "3.16.14.7"
  sha256 "ffb161d2d6c88ad4a91715f21960c632ed98cdbcc661eec95a9dfcf681e82740"

  keg_only "Conflicts with V8 in Homebrew/homebrew."

  def install
    system "make", "dependencies"
    system "make", "native",
                     "-j#{ENV.make_jobs}",
                     "library=shared",
                     "snapshot=on",
                     "console=readline"

    prefix.install "include"
    cd "out/native" do
      lib.install Dir["lib*"]
      bin.install "d8", "lineprocessor", "mksnapshot", "preparser", "process", "shell" => "v8"
    end
  end
end
