#!/usr/bin/env python3
"""Write Formula/keen.rb for keen's latest GitHub release.

Reads the release's checksums.txt, so the formula always names archives that
exist and checksums they really have. Prints the version; exits 0 whether or
not anything changed (git decides that).

    .github/scripts/update-keen.py            # latest release
    .github/scripts/update-keen.py v1.6.2     # a given tag
"""
import json
import pathlib
import sys
import urllib.request

REPO = "imogenlabs/keen"
FORMULA = pathlib.Path(__file__).resolve().parents[2] / "Formula" / "keen.rb"


def get(url):
    req = urllib.request.Request(url, headers={"Accept": "application/vnd.github+json", "User-Agent": "homebrew-tap"})
    with urllib.request.urlopen(req, timeout=60) as r:
        return r.read().decode()


def main():
    tag = sys.argv[1] if len(sys.argv) > 1 else json.loads(get(f"https://api.github.com/repos/{REPO}/releases/latest"))["tag_name"]
    base = f"https://github.com/{REPO}/releases/download/{tag}"
    sums = {}
    for line in get(f"{base}/checksums.txt").splitlines():
        digest, name = line.split()
        sums[name] = digest

    def block(os_name, arch):
        name = f"keen_{os_name}_{arch}.tar.gz"
        if name not in sums:
            return None
        return f'      url "{base}/{name}"\n      sha256 "{sums[name]}"\n'

    def platform(dsl, os_name):
        arm, intel = block(os_name, "arm64"), block(os_name, "amd64")
        if not (arm or intel):
            return ""
        out = f"  {dsl} do\n"
        # A Mac the release has no build for gets a clear refusal instead of a 404.
        if os_name == "darwin" and not intel:
            out += "    depends_on arch: :arm64\n"
        if arm:
            out += f"    on_arm do\n{arm}    end\n"
        if intel:
            out += f"    on_intel do\n{intel}    end\n"
        return out + "  end\n\n"


    FORMULA.write_text(f'''class Keen < Formula
  desc "Atlassian CLI and MCP server: Jira, Confluence, Bitbucket, Admin and more"
  homepage "https://github.com/{REPO}"
  license "Apache-2.0"

{platform("on_macos", "darwin")}{platform("on_linux", "linux")}  def install
    bin.install "keen", "keen-mcp"
  end

  test do
    assert_match "keen #{{version}}", shell_output("#{{bin}}/keen version")
    assert_predicate bin/"keen-mcp", :executable?
  end
end
''')
    print(tag)


if __name__ == "__main__":
    main()
