#!/bin/bash
# Installs the Bullpen CLI (https://cli.bullpen.fi) in Claude Code cloud sessions,
# whose containers start fresh each time.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

if command -v bullpen >/dev/null 2>&1; then
  exit 0
fi

# The postinstall script uses Node's https module, which only honors
# HTTPS_PROXY when NODE_USE_ENV_PROXY is set.
NODE_USE_ENV_PROXY=1 npm install -g @bullpenfi/cli >&2
bullpen --version >&2
