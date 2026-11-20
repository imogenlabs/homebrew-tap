class EightlyAgent < Formula
  desc "Lightweight Docker management agent for Eight.ly OS"
  homepage "https://eight.ly"
  version "2.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/imogenlabs/eightly-agent/releases/download/v2.1.1/eightly-agent-darwin-arm64"
      sha256 "2be4e869f2fbd0d5cac1bc866ec23192fb20481bf6f17fd39afccaafe284782a"
    end
    on_intel do
      url "https://github.com/imogenlabs/eightly-agent/releases/download/v2.1.1/eightly-agent-darwin-amd64"
      sha256 "cae844dee885b839c78075e88d07596f9383fc29a9aa08fd0e80329d14e03106"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/imogenlabs/eightly-agent/releases/download/v2.1.1/eightly-agent-linux-arm64"
      sha256 "5ce799acbd7a15d92685fc7b531e61c5994e79a597e51521173f1c7525cb659a"
    end
    on_intel do
      url "https://github.com/imogenlabs/eightly-agent/releases/download/v2.1.1/eightly-agent-linux-amd64"
      sha256 "c7bb55f67da79759e83bd0574968cc78213f4a617effd684bc40f61db4a16838"
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
