-------------------------------------------------------------------------------
-- DCM Definitions: Warehouses
-- Uses {{env_suffix}} for environment isolation, {{wh_size}} for sizing
-------------------------------------------------------------------------------

DEFINE WAREHOUSE TURBO_LOADING_WH{{env_suffix}}
  WAREHOUSE_SIZE = 'XSMALL'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE
  COMMENT = 'Ingestion workloads - used by TURBO_LOADER role';

DEFINE WAREHOUSE TURBO_TRANSFORM_WH{{env_suffix}}
  WAREHOUSE_SIZE = '{{wh_size}}'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE
  COMMENT = 'dbt transformation workloads - used by TURBO_TRANSFORMER role';

DEFINE WAREHOUSE TURBO_ANALYTICS_WH{{env_suffix}}
  WAREHOUSE_SIZE = '{{wh_size}}'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE
  COMMENT = 'Analytics queries - used by TURBO_ANALYST role';
