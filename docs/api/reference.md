# API Reference

## Overview

This section documents the main modules and classes in aiqso-odoo-crm.

## `main`

**Source:** `./api/main.py`

### Classes

#### `OdooConnection`

```python
from ..main import OdooConnection

# Usage
instance = OdooConnection()
```

#### `CreateInvoiceRequest`

```python
from ..main import CreateInvoiceRequest

# Usage
instance = CreateInvoiceRequest()
```

#### `CreateInvoiceResponse`

```python
from ..main import CreateInvoiceResponse

# Usage
instance = CreateInvoiceResponse()
```

#### `MarkPaidRequest`

```python
from ..main import MarkPaidRequest

# Usage
instance = MarkPaidRequest()
```

#### `MarkPaidResponse`

```python
from ..main import MarkPaidResponse

# Usage
instance = MarkPaidResponse()
```

#### `InvoiceResponse`

```python
from ..main import InvoiceResponse

# Usage
instance = InvoiceResponse()
```

### Functions

- `get_odoo()`

## `config`

**Source:** `./scripts/config.py`

### Functions

- `load_odoo_config()`
- `load_postgres_config()`
- `require_config()`
- `get_odoo_connection()`

## `create_products`

**Source:** `./scripts/create_products.py`

### Functions

- `create_products()`
- `list_products()`
- `main()`

## `health_check`

**Source:** `./scripts/health_check.py`

### Functions

- `check_odoo()`
- `check_odoo_auth()`
- `check_stripe()`
- `check_n()`
- `check_products()`
- `check_portal_module()`
- `main()`

## `import_commercial_leads`

**Source:** `./scripts/import_commercial_leads.py`

### Classes

#### `OdooCommercialImporter`

```python
from ..import_commercial_leads import OdooCommercialImporter

# Usage
instance = OdooCommercialImporter()
```

### Functions

- `main()`

## `import_lead_list`

**Source:** `./scripts/import_lead_list.py`

### Classes

#### `OdooLeadImporter`

```python
from ..import_lead_list import OdooLeadImporter

# Usage
instance = OdooLeadImporter()
```

### Functions

- `main()`

## `invite_portal_user`

**Source:** `./scripts/invite_portal_user.py`

### Functions

- `find_partner_by_email()`
- `create_partner()`
- `invite_to_portal()`
- `invite_portal_user()`
- `main()`

## `setup_stripe`

**Source:** `./scripts/setup_stripe.py`

### Functions

- `setup_stripe()`
- `main()`

## `sync_enriched_leads`

**Source:** `./scripts/sync_enriched_leads.py`

### Classes

#### `EnrichedLeadSync`

```python
from ..sync_enriched_leads import EnrichedLeadSync

# Usage
instance = EnrichedLeadSync()
```

### Functions

- `main()`

## `sync_products`

**Source:** `./scripts/sync_products.py`

### Functions

- `sync_products()`
- `list_all_products()`
- `main()`

