class EightlyAgent < Formula
  desc "Lightweight Docker management agent for Eight.ly OS"
  homepage "https://eight.ly"
  version "2.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/smashingtags/eightly-agent/releases/download/v2.0.0/eightly-agent-darwin-arm64"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/smashingtags/eightly-agent/releases/download/v2.0.0/eightly-agent-darwin-amd64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smashingtags/eightly-agent/releases/download/v2.0.0/eightly-agent-linux-arm64"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/smashingtags/eightly-agent/releases/download/v2.0.0/eightly-agent-linux-amd64"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    binary_name = "eightly-agent"
    # The downloaded file is already the binary
    bin.install Dir["eightly-agent-*"].first => binary_name
  end

  service do
    run [opt_bin/"eightly-agent"]
    keep_alive true
    log_path var/"log/eightly-agent.log"
    error_log_path var/"log/eightly-agent.log"
  end

  test do
    assert_match "eightly-agent", shell_output("#{bin}/eightly-agent --version 2>&1", 0)
  end
end
