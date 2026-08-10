class Agentdim < Formula
  desc "Instantly dim every connected display to zero without locking or sleeping the Mac"
  homepage "https://github.com/GoktugYalcin/agentdim"
  url "https://github.com/GoktugYalcin/agentdim/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "c435aa462f1134c616f0e11cbedc75c4e99b3e096d326df321059160f936062f"
  license "GPL-3.0-only"

  on_arm do
    depends_on "m1ddc"
  end

  on_intel do
    depends_on "ddcctl"
  end

  def install
    bin.install "agentdim.sh" => "agentdim"
  end

  def caveats
    <<~EOS
      The built-in display is dimmed via a native helper compiled on first run.
      This requires the Xcode Command Line Tools:
        xcode-select --install
    EOS
  end

  test do
    assert_match "Done", shell_output("#{bin}/agentdim 2>&1")
  end
end
