-- Revert svalbard:create_projects from pg

BEGIN;

DROP TABLE projects.projects;

DROP SCHEMA projects;

COMMIT;
