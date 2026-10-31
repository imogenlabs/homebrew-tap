# Homebrew Tap — Imogen Labs

Homebrew formulae for Imogen Labs products.

## Install

```bash
brew install imogenlabs/tap/keen
brew install imogenlabs/tap/eightly-agent
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `keen` | Atlassian CLI and MCP server ([imogenlabs/keen](https://github.com/imogenlabs/keen)). Updated automatically from its latest release every day |
| `eightly-agent` | Lightweight Docker management agent for Eight.ly OS |

## eightly-agent usage

```bash
# Start the agent
brew services start eightly-agent

# Or run directly
eightly-agent --port 9001 --secret "your-secret"
```
