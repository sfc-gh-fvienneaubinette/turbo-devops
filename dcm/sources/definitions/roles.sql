-------------------------------------------------------------------------------
-- DCM Definitions: Roles and Role Hierarchy
-- Three-tier pattern: loader, transformer, analyst + admin
-- Uses {{env_suffix}} for environment isolation
-------------------------------------------------------------------------------

DEFINE ROLE TURBO_ADMIN{{env_suffix}}
  COMMENT = 'Full control over TURBO_DEVOPS_DB{{env_suffix}} - owns all objects';

DEFINE ROLE TURBO_LOADER{{env_suffix}}
  COMMENT = 'Ingestion role - loads raw data from external stages';

DEFINE ROLE TURBO_TRANSFORMER{{env_suffix}}
  COMMENT = 'Transformation role - runs dbt models (reads RAW, writes STAGING/MARTS)';

DEFINE ROLE TURBO_ANALYST{{env_suffix}}
  COMMENT = 'Read-only access to MARTS schema for analytics';

-------------------------------------------------------------------------------
-- Role hierarchy: all subordinate roles roll up to TURBO_ADMIN
-- SYSADMIN inherits TURBO_ADMIN (best practice)
-------------------------------------------------------------------------------

GRANT ROLE TURBO_LOADER{{env_suffix}} TO ROLE TURBO_ADMIN{{env_suffix}};
GRANT ROLE TURBO_TRANSFORMER{{env_suffix}} TO ROLE TURBO_ADMIN{{env_suffix}};
GRANT ROLE TURBO_ANALYST{{env_suffix}} TO ROLE TURBO_ADMIN{{env_suffix}};
GRANT ROLE TURBO_ADMIN{{env_suffix}} TO ROLE SYSADMIN;
