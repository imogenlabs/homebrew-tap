class EightlyAgent < Formula
  desc "Lightweight Docker management agent for Eight.ly OS"
  homepage "https://eight.ly"
  version "1.0.0-beta1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/smashingtags/eightly-agent/releases/download/v1.0.0-beta1/eightly-agent-darwin-arm64"
      sha256 "b7f0fc04143e199694127bf8c16a0fd063f170953039e2008d22599f82abc936"
    end
    on_intel do
      url "https://github.com/smashingtags/eightly-agent/releases/download/v1.0.0-beta1/eightly-agent-darwin-amd64"
      sha256 "0f4b4f0c84f88ecaee69b3f69b5b82a34d108db7d61b69b2524dd5299d2c2d4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smashingtags/eightly-agent/releases/download/v1.0.0-beta1/eightly-agent-linux-arm64"
      sha256 "075441de667d1c1026a59b0f91dca521b92f76b8de3a83d3feb718f692dba691"
    end
    on_intel do
      url "https://github.com/smashingtags/eightly-agent/releases/download/v1.0.0-beta1/eightly-agent-linux-amd64"
      sha256 "c4bcd7ee2b943f8060f87864ac145a55998f56274883030c8bd1b18677614bdf"
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
