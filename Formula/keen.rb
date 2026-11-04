class Keen < Formula
  desc "Atlassian CLI and MCP server: Jira, Confluence, Bitbucket, Admin and more"
  homepage "https://github.com/imogenlabs/keen"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/imogenlabs/keen/releases/download/v1.9.0/keen_darwin_arm64.tar.gz"
      sha256 "8ade4379761d5051fc754247028fedf5fa578f400dabfe829c697a0398e4794f"
    end
    on_intel do
      url "https://github.com/imogenlabs/keen/releases/download/v1.9.0/keen_darwin_amd64.tar.gz"
      sha256 "34e8109c9f40734c73a4b0628588a7b1c25e73ec25b0744bc8017a798503121d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/imogenlabs/keen/releases/download/v1.9.0/keen_linux_arm64.tar.gz"
      sha256 "570c85ed919368896c6f9116fb84e12e123375c74b4f90368553379e5f838297"
    end
    on_intel do
      url "https://github.com/imogenlabs/keen/releases/download/v1.9.0/keen_linux_amd64.tar.gz"
      sha256 "f2758e3ee4f8f616ac7dff71c57920c6942a0e972774ecf4c8f29cc669085f33"
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
