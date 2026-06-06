class EbsAgent < Formula
  desc "Cross-platform backup agent for Eight.ly Backup Server"
  homepage "https://eight.ly"
  version "0.1.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/imogenlabs/eightly-backup-server/releases/download/v0.1.1/ebs-agent-darwin-arm64"
      sha256 "6fddf62eb0571cd85bfcb74c7673cee37b71f7fe63c6691fc8449b7a1cc1359b"
    end
    on_intel do
      url "https://github.com/imogenlabs/eightly-backup-server/releases/download/v0.1.1/ebs-agent-darwin-amd64"
      sha256 "06bd6c41fd4902748e71a8012cc77e7535a67434236e0cf2e99d70a1f9d27ab4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/imogenlabs/eightly-backup-server/releases/download/v0.1.1/ebs-agent-linux-arm64"
      sha256 "22c129f0a6fe1ae1b3c5564049810f1a9a42424c4ec66c462806bb8cf86a93a6"
    end
    on_intel do
      url "https://github.com/imogenlabs/eightly-backup-server/releases/download/v0.1.1/ebs-agent-linux-amd64"
      sha256 "1d5ddfcb2be6319e3305e19d4af56cf947e7477b24999800e108c2b90018e5ea"
    end
  end

  def install
    # The downloaded asset is the bare binary; install it as `ebs-agent`.
    bin.install Dir["ebs-agent-*"].first => "ebs-agent"
  end

  test do
    # Running with no subcommand prints usage and exits 2.
    assert_match "usage", shell_output("#{bin}/ebs-agent 2>&1", 2)
  end
end
