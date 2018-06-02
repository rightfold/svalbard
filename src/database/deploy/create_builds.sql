-- Deploy svalbard:create_builds to pg
-- requires: create_projects

START TRANSACTION;

CREATE SCHEMA builds;

CREATE DOMAIN builds.version
    AS CHARACTER VARYING[]
    CONSTRAINT version_check
        CHECK (array_length(VALUE, 1) >= 1);

CREATE DOMAIN builds.status
    AS INTEGER
    CONSTRAINT status_check
        CHECK (VALUE BETWEEN 0 AND 3);

CREATE TABLE builds.builds (
    project_id uuid                     NOT NULL,
    build_id   uuid                     NOT NULL,
    version    builds.version           NOT NULL,
    started    TIMESTAMP WITH TIME ZONE NOT NULL,
    finished   TIMESTAMP WITH TIME ZONE,
    status     builds.status            NOT NULL,
    failure    CHARACTER VARYING,
    exit_code  SMALLINT,
    CONSTRAINT builds_pk
        PRIMARY KEY (project_id, build_id),
    CONSTRAINT builds_project_fk
        FOREIGN KEY (project_id)
        REFERENCES projects.projects,
    CONSTRAINT status_finished_check
        CHECK ((status = 0) = (finished IS NULL)),
    CONSTRAINT status_failure_check
        CHECK ((status = 1) = (failure IS NOT NULL)),
    CONSTRAINT status_exit_code_check
        CHECK (
            (status IN (2, 3)) = (exit_code IS NOT NULL)
            AND (status = 2) = (exit_code = 0)
        )
);

CREATE INDEX builds_project_version_started_idx
    ON builds.builds
    (project_id, version, started DESC);

COMMIT WORK;
