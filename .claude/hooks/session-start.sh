#!/bin/bash
set -euo pipefail

# Only run in Claude Code cloud sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install the Bullpen CLI (also installs its bullpen-cli / bullpen-bracket agent skills)
if ! command -v bullpen >/dev/null 2>&1; then
  npm install -g @bullpenfi/cli
fi

bullpen --version
