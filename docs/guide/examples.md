# Examples

This section contains usage examples for aiqso-odoo-crm.

## Usage Patterns (from tests)

Example from `tests/test_import_lead_list.py`:

```
"""Unit tests for scripts/import_lead_list.py"""

import csv
import os
import sys
import tempfile
from unittest import mock

import pytest

# Add scripts directory to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "scripts"))

from import_lead_list import CATEGORY_COLORS, OdooLeadImporter


class TestCategoryColors:
    """Tests for CATEGORY_COLORS constant."""

    def test_contains_required_categories(self):
        required = ["Lead List", "For Sale", "Outreach Target", "Premium", "High Value", "Medium Value", "Low Value"]
        for cat in required:
            assert cat in CATEGORY_COLORS

    def test_colors_are_integers(self):
        for name, color in CATEGORY_COLORS.items():
            assert isinstance(color, int), f"{name} color should be int"


class TestOdooLeadImporterInit:
    """Tests for OdooLeadImporter initialization."""

    @mock.patch("import_lead_list.xmlrpc.client.ServerProxy")
    def test_successful_connection(self, mock_server_proxy):
        """Test successful Odoo connection."""
        mock_common = mock.MagicMock()
        mock_common.authenticate.return_value = 123
        mock_models = mock.MagicMock()

        mock_server_proxy.side_effect = [mock_common, mock_models]
```
