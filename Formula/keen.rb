class Keen < Formula
  desc "Atlassian CLI and MCP server: Jira, Confluence, Bitbucket, Admin and more"
  homepage "https://github.com/imogenlabs/keen"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/imogenlabs/keen/releases/download/v1.6.2/keen_darwin_arm64.tar.gz"
      sha256 "9ef16b9e9f0e372a1a7f8c0454c58d99795839b4eab0b01f1592c86648903179"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/imogenlabs/keen/releases/download/v1.6.2/keen_linux_arm64.tar.gz"
      sha256 "a88141a3b9dbb328ec1a99147b425e735138cb944a1977e229c355128dad0c66"
    end
    on_intel do
      url "https://github.com/imogenlabs/keen/releases/download/v1.6.2/keen_linux_amd64.tar.gz"
      sha256 "c351b26587e3cb78b10f3fb0a105cc855c0123f8386bbf677e5bef5397bce18d"
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
