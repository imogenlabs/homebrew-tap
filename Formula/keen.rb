class Keen < Formula
  desc "Atlassian CLI and MCP server: Jira, Confluence, Bitbucket, Admin and more"
  homepage "https://github.com/imogenlabs/keen"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/imogenlabs/keen/releases/download/v1.6.4/keen_darwin_arm64.tar.gz"
      sha256 "9a59dff8a8cc214f62d2cc8efef456076ba3ecaea68567db672354582d96777e"
    end
    on_intel do
      url "https://github.com/imogenlabs/keen/releases/download/v1.6.4/keen_darwin_amd64.tar.gz"
      sha256 "0d97557cdca137e259d40ce2823c166c54ce836ae7dfa2152c7140723f1c8ba5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/imogenlabs/keen/releases/download/v1.6.4/keen_linux_arm64.tar.gz"
      sha256 "6030a86a11c20ce048725fb97036bc37359ddd13240e05ce9a199b7f218cf971"
    end
    on_intel do
      url "https://github.com/imogenlabs/keen/releases/download/v1.6.4/keen_linux_amd64.tar.gz"
      sha256 "8fdd76e92db2fa88a6192d5b697ab243878943d3945ccec55d387fce02d02dc7"
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
