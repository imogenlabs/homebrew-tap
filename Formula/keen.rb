class Keen < Formula
  desc "Atlassian CLI and MCP server: Jira, Confluence, Bitbucket, Admin and more"
  homepage "https://github.com/imogenlabs/keen"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/imogenlabs/keen/releases/download/v1.8.0/keen_darwin_arm64.tar.gz"
      sha256 "b4e23b8011e1cf717a3c597d9db137dcadd26872b1a6d98fa7d242f4b6040980"
    end
    on_intel do
      url "https://github.com/imogenlabs/keen/releases/download/v1.8.0/keen_darwin_amd64.tar.gz"
      sha256 "82ab7de85a773256b6de9a4e131d4c38660cb4892f8d487477b9d21e02cf94c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/imogenlabs/keen/releases/download/v1.8.0/keen_linux_arm64.tar.gz"
      sha256 "4cc6d580b5f7f1f5f2431d7ce8c9ac7a1e82867e5c5def0710cccbfd9639880d"
    end
    on_intel do
      url "https://github.com/imogenlabs/keen/releases/download/v1.8.0/keen_linux_amd64.tar.gz"
      sha256 "57d2b9f6588e03bed16f7c357978447c59761bce389bf49f441887c3f8b49224"
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
