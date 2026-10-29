#!/bin/bash
set -euo pipefail

# Only run in Claude Code cloud sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install the Archify diagram skill (https://github.com/tt-a1i/archify) unless it is already there
if [ ! -f "$HOME/.claude/skills/archify/SKILL.md" ]; then
  npx -y skills add tt-a1i/archify -g -y --agent claude-code >&2
fi
