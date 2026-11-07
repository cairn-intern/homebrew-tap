class Cairn < Formula
  desc "Terminal-based coding agent, built by Cairn"
  homepage "https://github.com/cairn/cairn"
  version "0.3.5"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/cairn/cairn/releases/download/v0.3.5/cairn-code-macos-aarch64"
      sha256 "9c93da4d02ebff95a55092620d47bb7a3871cd082d6c6030ef2e654fe1f1d066"
    end
    on_intel do
      url "https://github.com/cairn/cairn/releases/download/v0.3.5/cairn-code-macos-x86_64"
      sha256 "b1358fea83ba3db8910e80fb745c6de7b2340435d330ce8ef2f19e16154daa98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cairn/cairn/releases/download/v0.3.5/cairn-code-linux-aarch64"
      sha256 "cef69c65e1e36b9c6abab406509bc4a5852ab2d01e7dd5f7507a0358dd082cd2"
    end
    on_intel do
      url "https://github.com/cairn/cairn/releases/download/v0.3.5/cairn-code-linux-x86_64"
      sha256 "ca947f88f906fef0d10f8c3a32629320f098469d2911fc8b684e87566c647613"
    end
  end

  def install
    asset = Dir["cairn-code-*"].first
    bin.install asset => "cairn"
  end

  def caveats
    <<~EOS
      Cairn Code self-updates with `cairn update`. If you installed it with
      Homebrew, prefer `brew upgrade cairn` so Homebrew stays in charge
      of the binary.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cairn --version")
  end
end
