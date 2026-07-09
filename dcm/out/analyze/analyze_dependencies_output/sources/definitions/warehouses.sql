-------------------------------------------------------------------------------
-- DCM Definitions: Warehouses
-- Uses _DEV for environment isolation, XSMALL for sizing
-------------------------------------------------------------------------------

DEFINE WAREHOUSE TURBO_LOADING_WH_DEV
  WAREHOUSE_SIZE = 'XSMALL'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE
  COMMENT = 'Ingestion workloads - used by TURBO_LOADER role';

DEFINE WAREHOUSE TURBO_TRANSFORM_WH_DEV
  WAREHOUSE_SIZE = 'XSMALL'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE
  COMMENT = 'dbt transformation workloads - used by TURBO_TRANSFORMER role';

DEFINE WAREHOUSE TURBO_ANALYTICS_WH_DEV
  WAREHOUSE_SIZE = 'XSMALL'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE
  COMMENT = 'Analytics queries - used by TURBO_ANALYST role';