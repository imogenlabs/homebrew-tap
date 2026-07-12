# Homebrew Tap — Eight.ly

Homebrew formulae for [Eight.ly](https://eight.ly) products.

## Install

```bash
brew install imogenlabs/tap/eightly-agent
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
