use postgres;

pub enum Error
{
    Postgres(postgres::Error),
}

impl From<postgres::Error> for Error
{
    fn from(other: postgres::Error) -> Self
    {
        Error::Postgres(other)
    }
}

pub fn run_build(db: &postgres::Connection) -> Result<(), Error>
{
    db.execute("
        INSERT INTO builds.builds
            (project_id, build_id, version, started, status)
        VALUES
            ($1, $2, $3, $4, $5)
    ", &[])?;

    Ok(())
}
