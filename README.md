# Homebrew Tap — Eight.ly

Homebrew formulae for [Eight.ly](https://eight.ly) products.

> **Note:** SHA256 hashes are currently PLACEHOLDERs. They will be updated when the v2.0.0 release is cut and binaries are published.

## Install

```bash
brew install smashingtags/tap/eightly-agent
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `eightly-agent` | Lightweight Docker management agent for Eight.ly OS |

## Usage

```bash
# Start the agent
brew services start eightly-agent

# Or run directly
eightly-agent --port 9001 --secret "your-secret"
```
