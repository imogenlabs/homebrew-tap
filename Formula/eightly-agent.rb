class EightlyAgent < Formula
  desc "Lightweight Docker management agent for Eight.ly OS"
  homepage "https://eight.ly"
  version "2.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/imogenlabs/eightly-agent/releases/download/v2.1.0/eightly-agent-darwin-arm64"
      sha256 "4554a45f82ef04d77b7396077e5479347581b9724f9301fc0b18617be99c7e41"
    end
    on_intel do
      url "https://github.com/imogenlabs/eightly-agent/releases/download/v2.1.0/eightly-agent-darwin-amd64"
      sha256 "a1c4917a18c057048c92b1baa9959dd6a3d131e88c6fc586fdd6bd5ad4bba2c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/imogenlabs/eightly-agent/releases/download/v2.1.0/eightly-agent-linux-arm64"
      sha256 "046aabfc09135ea96a589d7a6ef8282ac33cf4d958b48fea909061d6644a61c0"
    end
    on_intel do
      url "https://github.com/imogenlabs/eightly-agent/releases/download/v2.1.0/eightly-agent-linux-amd64"
      sha256 "bbe215982d7158c37dde2973e3c77c88aef22ddb58dc34ce4ddc77900915d05a"
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
