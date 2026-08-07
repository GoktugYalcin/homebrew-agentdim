class Agentdim < Formula
  desc "Instantly dim every connected display to zero without locking or sleeping the Mac"
  homepage "https://github.com/GoktugYalcin/agentdim"
  url "https://github.com/GoktugYalcin/agentdim/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "50dedc84c9ef8b5efb543cde59d7e6fb83a6ee42cf1a1e68756f09ba30a52993"
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
