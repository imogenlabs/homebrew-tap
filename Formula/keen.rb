class Keen < Formula
  desc "Atlassian CLI and MCP server: Jira, Confluence, Bitbucket, Admin and more"
  homepage "https://github.com/imogenlabs/keen"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/imogenlabs/keen/releases/download/v1.6.1/keen_darwin_arm64.tar.gz"
      sha256 "fd97cbba196fcba351746fd7450edb475822c0b9dbd581612d7d0b28e714fdd7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/imogenlabs/keen/releases/download/v1.6.1/keen_linux_arm64.tar.gz"
      sha256 "7563ed5e2d611e8a89042c8f2dc2301b1dd825fbdf22087350a7aa049cfee4db"
    end
    on_intel do
      url "https://github.com/imogenlabs/keen/releases/download/v1.6.1/keen_linux_amd64.tar.gz"
      sha256 "8162e618c006cce0feaa82add5bc642ff02cda69d96ff3a06b97f5d10da77d5b"
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
