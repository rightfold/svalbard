-- Revert svalbard:create_builds from pg

BEGIN;

DROP TABLE builds.builds;

DROP DOMAIN builds.status;

DROP DOMAIN builds.version;

DROP SCHEMA builds;

COMMIT;
