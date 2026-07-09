-------------------------------------------------------------------------------
-- DCM Definitions: Database, Schemas
-- Managed by DCM - do not modify these objects manually
-- Uses {{env_suffix}} to differentiate DEV and PROD environments
-------------------------------------------------------------------------------

DEFINE DATABASE TURBO_DEVOPS_DB{{env_suffix}}
  COMMENT = 'E-commerce analytics database managed by DCM';

DEFINE SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.RAW
  COMMENT = 'Raw data ingested from external sources (S3)';

DEFINE SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.STAGING
  COMMENT = 'Staging layer - cleaned and typed data (dbt staging models)';

DEFINE SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.MARTS
  COMMENT = 'Business-ready dimensional models (dbt mart models)';

DEFINE SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.UTILITIES
  COMMENT = 'Utility objects - file formats, sequences, procedures, secrets';