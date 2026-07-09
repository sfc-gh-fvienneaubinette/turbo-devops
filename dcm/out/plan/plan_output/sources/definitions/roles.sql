-------------------------------------------------------------------------------
-- DCM Definitions: Roles and Role Hierarchy
-- Three-tier pattern: loader, transformer, analyst + admin
-- Uses _DEV for environment isolation
-------------------------------------------------------------------------------

DEFINE ROLE TURBO_ADMIN_DEV
  COMMENT = 'Full control over TURBO_DEVOPS_DB_DEV - owns all objects';

DEFINE ROLE TURBO_LOADER_DEV
  COMMENT = 'Ingestion role - loads raw data from external stages';

DEFINE ROLE TURBO_TRANSFORMER_DEV
  COMMENT = 'Transformation role - runs dbt models (reads RAW, writes STAGING/MARTS)';

DEFINE ROLE TURBO_ANALYST_DEV
  COMMENT = 'Read-only access to MARTS schema for analytics';

-------------------------------------------------------------------------------
-- Role hierarchy: all subordinate roles roll up to TURBO_ADMIN
-- SYSADMIN inherits TURBO_ADMIN (best practice)
-------------------------------------------------------------------------------

GRANT ROLE TURBO_LOADER_DEV TO ROLE TURBO_ADMIN_DEV;
GRANT ROLE TURBO_TRANSFORMER_DEV TO ROLE TURBO_ADMIN_DEV;
GRANT ROLE TURBO_ANALYST_DEV TO ROLE TURBO_ADMIN_DEV;
GRANT ROLE TURBO_ADMIN_DEV TO ROLE SYSADMIN;