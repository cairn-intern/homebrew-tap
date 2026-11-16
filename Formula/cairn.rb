class Cairn < Formula
  desc "Terminal-based coding agent, built by Cairn"
  homepage "https://github.com/cairn/cairn"
  version "0.3.7"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/cairn/cairn/releases/download/v0.3.7/cairn-code-macos-aarch64"
      sha256 "4d589b0f519d93e6e5f3121d8549ab9b3dbd490449b5e0ab84fe5b5779b9b0d9"
    end
    on_intel do
      url "https://github.com/cairn/cairn/releases/download/v0.3.7/cairn-code-macos-x86_64"
      sha256 "ffa42cb429eb917a392735c75010338d636fb8fba40eb2e239d17f6bafe609e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cairn/cairn/releases/download/v0.3.7/cairn-code-linux-aarch64"
      sha256 "be574b8e2c58f60ec21dc1938c9e16c9437b4a4c93644f02423165c9dae515a4"
    end
    on_intel do
      url "https://github.com/cairn/cairn/releases/download/v0.3.7/cairn-code-linux-x86_64"
      sha256 "4cbc59070c2cf3f2f4d4cee8db5db7019e872552126f91652e9d48bee196da27"
    end
  end

  def install
    asset = Dir["cairn-code-*"].first
    bin.install asset => "cairn"
    # Claim the generic `agent` name too, as a symlink so upgrades keep
    # it pointing at the current binary.
    bin.install_symlink "cairn" => "agent"
  end

  def caveats
    <<~EOS
      Cairn self-updates with `cairn update`. If you installed it with
      Homebrew, prefer `brew upgrade cairn` so Homebrew stays in charge
      of the binary.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cairn --version")
    assert_match version.to_s, shell_output("#{bin}/agent --version")
  end
end
