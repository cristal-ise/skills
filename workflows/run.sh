#!/usr/bin/env bash
# Prototype workflow runner: iterates a declarative workflow manifest (.agents/workflows/*.json).
# The driver agent (or human) dispatches the emitted step; this script only tracks order and state.
#
# Usage:
#   run.sh <workflow.json> list                 # print all steps in order
#   run.sh <workflow.json> next [statefile]     # print the next pending step as JSON (for dispatch)
#   run.sh <workflow.json> done <step> [state]  # mark a step completed
#   run.sh <workflow.json> reset [statefile]    # clear state
set -euo pipefail

wf="$1"; cmd="$2"; arg="${3:-}"

case "$cmd" in
  list)
    jq -c '.steps[] | {name, agent_type, done_when}' "$wf" ;;
  next)
    state="${arg:-.workflow-state.json}"
    done_steps=$(jq -r '.done // [] | .[]' "$state" 2>/dev/null || true)
    jq -c --argjson done "$(jq -n --arg d "$done_steps" '($d | split("\n") | map(select(length > 0)))')" \
      '.steps[] | select(.name as $n | $done | index($n) | not) | {name, agent_type, loads, task, done_when}' "$wf" | head -1 ;;
  done)
    state="${4:-.workflow-state.json}"
    [ -f "$state" ] || echo '{"done": []}' > "$state"
    jq --arg s "$arg" '.done += [$s] | .done |= unique' "$state" > "$state.tmp" && mv "$state.tmp" "$state"
    echo "marked done: $arg" ;;
  reset)
    state="${arg:-.workflow-state.json}"
    echo '{"done": []}' > "$state" ;;
  *) echo "unknown command: $cmd" >&2; exit 2 ;;
esac
