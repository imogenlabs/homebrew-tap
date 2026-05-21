class EightlyAgent < Formula
  desc "Lightweight Docker management agent for Eight.ly OS"
  homepage "https://eight.ly"
  version "1.0.0-beta1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/smashingtags/eightly-agent/releases/download/v1.0.0-beta1/eightly-agent-darwin-arm64"
      sha256 "6ff1fd47007a156df6c721b9a56855f0a3d4426c8ac505309f2f124e0fe3f8b3"
    end
    on_intel do
      url "https://github.com/smashingtags/eightly-agent/releases/download/v1.0.0-beta1/eightly-agent-darwin-amd64"
      sha256 "45727745fb8ce25819a7f5af1d553e7b99edea39b16f7aca2be370c4acb3e0df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smashingtags/eightly-agent/releases/download/v1.0.0-beta1/eightly-agent-linux-arm64"
      sha256 "1568617f138538eeb3bc1c5d701d522d7b7b65339b5914a3cd884404504853b9"
    end
    on_intel do
      url "https://github.com/smashingtags/eightly-agent/releases/download/v1.0.0-beta1/eightly-agent-linux-amd64"
      sha256 "5b6eb321fc23bc532faef70ac5766be935d1fd9418865afbe2d7c58f636cbf52"
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
