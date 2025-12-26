# Implementation Notes

## Why config moved to environment variables

The original scripts contained hardcoded Odoo API keys and a PostgreSQL password. This is high-risk in any environment where the repository could be copied, backed up, or shared.

Changes:

- Centralized config loading in `scripts/config.py`.
- Enforced required config at runtime (clear failure messages).
- Added `.env.example` for repeatable local setup while keeping `.env` out of version control.

## Why Odoo field validation was added

Odoo installations vary (modules installed, customizations, version differences). Writing a field that doesn’t exist can hard-fail an entire sync run.

Change:

- `scripts/sync_enriched_leads.py` now uses `fields_get` to determine valid field names and drops invalid keys before writing/creating records.

## Testing / Validation

There is no established automated test suite in this repo (no `pytest`, no CI). For now, minimal safety checks are used:

- `python3 -m py_compile scripts/*.py`
- `bash -n scripts/odoo-sync.sh`

Recommendation if this repo grows:

- Add `pytest` with unit tests for CSV parsing/mapping and for config validation behavior.
- Add a small mocked XML-RPC adapter layer so Odoo calls can be tested without a live server.

