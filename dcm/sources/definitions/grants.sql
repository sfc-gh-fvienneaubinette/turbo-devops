-------------------------------------------------------------------------------
-- DCM Definitions: Grants
-- Assigns privileges to each role following least-privilege principle
-- Uses {{env_suffix}} for environment isolation
-------------------------------------------------------------------------------

-- =============================================================================
-- TURBO_LOADER: Can load data into RAW schema
-- =============================================================================

GRANT USAGE ON DATABASE TURBO_DEVOPS_DB{{env_suffix}} TO ROLE TURBO_LOADER{{env_suffix}};
GRANT USAGE ON SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.RAW TO ROLE TURBO_LOADER{{env_suffix}};
GRANT CREATE TABLE ON SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.RAW TO ROLE TURBO_LOADER{{env_suffix}};
GRANT USAGE ON SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.UTILITIES TO ROLE TURBO_LOADER{{env_suffix}};
GRANT USAGE ON WAREHOUSE TURBO_LOADING_WH{{env_suffix}} TO ROLE TURBO_LOADER{{env_suffix}};

-- =============================================================================
-- TURBO_TRANSFORMER: Reads RAW, writes STAGING and MARTS
-- =============================================================================

GRANT USAGE ON DATABASE TURBO_DEVOPS_DB{{env_suffix}} TO ROLE TURBO_TRANSFORMER{{env_suffix}};
GRANT USAGE ON SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.RAW TO ROLE TURBO_TRANSFORMER{{env_suffix}};
GRANT SELECT ON FUTURE TABLES IN SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.RAW TO ROLE TURBO_TRANSFORMER{{env_suffix}};
GRANT USAGE ON SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.STAGING TO ROLE TURBO_TRANSFORMER{{env_suffix}};
GRANT CREATE TABLE ON SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.STAGING TO ROLE TURBO_TRANSFORMER{{env_suffix}};
GRANT CREATE VIEW ON SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.STAGING TO ROLE TURBO_TRANSFORMER{{env_suffix}};
GRANT USAGE ON SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.MARTS TO ROLE TURBO_TRANSFORMER{{env_suffix}};
GRANT CREATE TABLE ON SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.MARTS TO ROLE TURBO_TRANSFORMER{{env_suffix}};
GRANT CREATE VIEW ON SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.MARTS TO ROLE TURBO_TRANSFORMER{{env_suffix}};
GRANT USAGE ON WAREHOUSE TURBO_TRANSFORM_WH{{env_suffix}} TO ROLE TURBO_TRANSFORMER{{env_suffix}};

-- =============================================================================
-- TURBO_ANALYST: Read-only on MARTS
-- =============================================================================

GRANT USAGE ON DATABASE TURBO_DEVOPS_DB{{env_suffix}} TO ROLE TURBO_ANALYST{{env_suffix}};
GRANT USAGE ON SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.MARTS TO ROLE TURBO_ANALYST{{env_suffix}};
GRANT SELECT ON FUTURE TABLES IN SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.MARTS TO ROLE TURBO_ANALYST{{env_suffix}};
GRANT SELECT ON FUTURE VIEWS IN SCHEMA TURBO_DEVOPS_DB{{env_suffix}}.MARTS TO ROLE TURBO_ANALYST{{env_suffix}};
GRANT USAGE ON WAREHOUSE TURBO_ANALYTICS_WH{{env_suffix}} TO ROLE TURBO_ANALYST{{env_suffix}};
