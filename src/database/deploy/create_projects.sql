-- Deploy svalbard:create_projects to pg

START TRANSACTION;

CREATE SCHEMA projects;

CREATE TABLE projects.projects (
    id uuid NOT NULL,
    CONSTRAINT projects_pk
        PRIMARY KEY (id)
);

COMMIT WORK;
