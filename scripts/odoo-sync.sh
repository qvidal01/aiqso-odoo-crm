#!/bin/bash
# Odoo Lead Sync Script
# Syncs enriched leads from PostgreSQL to Odoo CRM
# Run after the accela enrichment job completes

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$SCRIPT_DIR/../venv"
LOG_FILE="$SCRIPT_DIR/../logs/sync_$(date +%Y%m%d).log"
ENV_FILE="$SCRIPT_DIR/../.env"

# Create logs directory if needed
mkdir -p "$(dirname "$LOG_FILE")"

echo "========================================" >> "$LOG_FILE"
echo "Odoo Sync Started: $(date)" >> "$LOG_FILE"
echo "========================================" >> "$LOG_FILE"

# Activate virtual environment
if [ -d "$VENV_DIR" ]; then
    source "$VENV_DIR/bin/activate"
else
    echo "ERROR: Virtual environment not found at $VENV_DIR" >> "$LOG_FILE"
    exit 1
fi

# Load environment variables (Odoo + Postgres credentials)
if [ -f "$ENV_FILE" ]; then
    set -a
    # shellcheck disable=SC1090
    source "$ENV_FILE"
    set +a
else
    echo "WARN: .env not found at $ENV_FILE (will rely on process environment)" >> "$LOG_FILE"
fi

# Run the sync script
# --create-new: Create new leads for permits not found in Odoo
python3 "$SCRIPT_DIR/sync_enriched_leads.py" --create-new >> "$LOG_FILE" 2>&1

EXIT_CODE=$?

echo "Sync completed with exit code: $EXIT_CODE" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

exit $EXIT_CODE
