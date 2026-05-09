#!/bin/bash
# Wrapper script to run mcp_excel_server with correct PYTHONPATH
cd "$(dirname "$0")"
export PYTHONPATH="/Users/courcirc8/Documents/Cursor/MCPs/mcp_excel_server/src:$PYTHONPATH"

# Install the package in development mode if not already done
if ! /Users/courcirc8/Documents/Cursor/MCPs/mcp_excel_server/.venv/bin/python3.13 -c "import mcp_excel_server" 2>/dev/null; then
    echo "Installing mcp_excel_server in development mode..." >&2
    cd /Users/courcirc8/Documents/Cursor/MCPs/mcp_excel_server
    /Users/courcirc8/Documents/Cursor/MCPs/mcp_excel_server/.venv/bin/pip install -e . --no-build-isolation 2>&1 | grep -v "Requirement already satisfied" >&2
fi

exec /Users/courcirc8/Documents/Cursor/MCPs/mcp_excel_server/.venv/bin/python3.13 -m mcp_excel_server "$@"


