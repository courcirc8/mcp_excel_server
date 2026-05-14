#!/bin/bash
# Wrapper script to run mcp_excel_server with correct PYTHONPATH
cd "$(dirname "$0")"
SCRIPT_DIR="$(pwd)"
export PYTHONPATH="$SCRIPT_DIR/src:$PYTHONPATH"

# Install the package in development mode if not already done
if ! "$SCRIPT_DIR/.venv/bin/python3.13" -c "import mcp_excel_server" 2>/dev/null; then
    echo "Installing mcp_excel_server in development mode..." >&2
    "$SCRIPT_DIR/.venv/bin/pip" install -e . --no-build-isolation 2>&1 | grep -v "Requirement already satisfied" >&2
fi

exec "$SCRIPT_DIR/.venv/bin/python3.13" -m mcp_excel_server "$@"
