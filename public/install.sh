#!/usr/bin/env sh
# stackmcp — one-line install
# Usage: curl -fsSL https://stackmcp.io/install.sh | sh

set -eu

INSTALL_DIR="${STACKMCP_HOME:-$HOME/.stackmcp}"
BIN_DIR="${STACKMCP_BIN_DIR:-/usr/local/bin}"
VERSION="${STACKMCP_VERSION:-latest}"

# ── Colors ────────────────────────────────────────────────
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo ""
echo " ${BLUE}┌──────────────────────────────────────┐${NC}"
echo " ${BLUE}│  Installing StackMCP...              │${NC}"
echo " ${BLUE}└──────────────────────────────────────┘${NC}"
echo ""

# Check for Node.js
if ! command -v node >/dev/null 2>&1; then
  echo " Error: Node.js is required. Install it from https://nodejs.org"
  exit 1
fi

NODE_VERSION=$(node -e "console.log(process.version.slice(1).split('.')[0])")
if [ "$NODE_VERSION" -lt 18 ]; then
  echo " Error: Node.js >= 18 is required (found v$(node -v))"
  exit 1
fi

echo " ✓ Node.js $(node -v) detected"

# Create config dir
mkdir -p "$INSTALL_DIR"

# Install via npm (when published)
if npm install -g stackmcp 2>/dev/null; then
  echo ""
  echo " ${GREEN}✓ StackMCP installed!${NC}"
  echo ""
  echo " Next steps:"
  echo ""
  echo "   stackmcp init              Configure your MCP servers"
  echo "   stackmcp daemon start      Start the daemon"
  echo "   stackmcp stacks            List available stacks"
  echo ""
  exit 0
fi

# Fallback: install from GitHub
echo " No npm package found. Installing from GitHub..."
REPO="${STACKMCP_REPO:-saidstack/stackmcp.io}"
TMP_DIR=$(mktemp -d)
echo " Cloning $REPO..."
git clone --depth 1 "https://github.com/$REPO.git" "$TMP_DIR/stackmcp"
cd "$TMP_DIR/stackmcp"
npm install --production
mkdir -p "$BIN_DIR"
ln -sf "$(pwd)/bin/stackmcp" "$BIN_DIR/stackmcp"
echo ""
echo " ${GREEN}✓ StackMCP installed to $BIN_DIR/stackmcp${NC}"
echo ""
echo " Next steps:"
echo "   stackmcp init              Configure your MCP servers"
echo "   stackmcp daemon start      Start the daemon"
echo "   stackmcp stacks            List available stacks"
echo ""
