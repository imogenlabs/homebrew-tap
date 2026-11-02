class Keen < Formula
  desc "Atlassian CLI and MCP server: Jira, Confluence, Bitbucket, Admin and more"
  homepage "https://github.com/imogenlabs/keen"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/imogenlabs/keen/releases/download/v1.7.0/keen_darwin_arm64.tar.gz"
      sha256 "0a4d538d9ce7f2723c6a782b3b6e0bfd16f0372c7f8470736355960fbc8acc8e"
    end
    on_intel do
      url "https://github.com/imogenlabs/keen/releases/download/v1.7.0/keen_darwin_amd64.tar.gz"
      sha256 "ac03710728ef19e62db5bc5e4489bb37e69f2af8598c26069cd74d6295f77cef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/imogenlabs/keen/releases/download/v1.7.0/keen_linux_arm64.tar.gz"
      sha256 "f6821119a7fe97d2b21fbaf8c44cb5b1caac94a87c79a91c2a915b2b8c7eb00d"
    end
    on_intel do
      url "https://github.com/imogenlabs/keen/releases/download/v1.7.0/keen_linux_amd64.tar.gz"
      sha256 "caa17583cff2a7a9f9aee531277e68ba32d6fee4e165604f3639e6a107fc97c0"
    end
  end

  def install
    bin.install "keen", "keen-mcp"
  end

  test do
    assert_match "keen #{version}", shell_output("#{bin}/keen version")
    assert_predicate bin/"keen-mcp", :executable?
  end
end
