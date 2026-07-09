-------------------------------------------------------------------------------
-- DCM Definitions: Database, Schemas
-- Managed by DCM - do not modify these objects manually
-- Uses _DEV to differentiate DEV and PROD environments
-------------------------------------------------------------------------------

DEFINE DATABASE TURBO_DEVOPS_DB_DEV
  COMMENT = 'E-commerce analytics database managed by DCM';

DEFINE SCHEMA TURBO_DEVOPS_DB_DEV.RAW
  COMMENT = 'Raw data ingested from external sources (S3)';

DEFINE SCHEMA TURBO_DEVOPS_DB_DEV.STAGING
  COMMENT = 'Staging layer - cleaned and typed data (dbt staging models)';

DEFINE SCHEMA TURBO_DEVOPS_DB_DEV.MARTS
  COMMENT = 'Business-ready dimensional models (dbt mart models)';

DEFINE SCHEMA TURBO_DEVOPS_DB_DEV.UTILITIES
  COMMENT = 'Utility objects - file formats, sequences, procedures, secrets';