extern crate clap;

fn main()
{
    clap::App::new("svalbard-build")
        .version(env!("CARGO_PKG_VERSION"))
        .about("Run a build and report its status.")
        .arg(
            clap::Arg::with_name("postgresql-connection-string")
                .long("postgresql-connection-string")
                .env("SVALBARD_POSTGRESQL_CONNECTION_STRING")
                .value_name("POSTGRESQL CONNECTION STRING")
                .help("The PostgreSQL connection string")
                .takes_value(true)
                .required(true)
        )
        .arg(
            clap::Arg::with_name("postgresql-tls-mode")
                .long("postgresql-tls-mode")
                .env("SVALBARD_POSTGRESQL_TLS_MODE")
                .value_name("POSTGRESQL TLS MODE")
                .help("The PostgreSQL TLS mode")
                .takes_value(true)
                .required(true)
        )
        .arg(
            clap::Arg::with_name("build-project")
                .long("build-project")
                .value_name("PROJECT")
                .help("The project being built")
                .takes_value(true)
                .required(true)
        )
        .arg(
            clap::Arg::with_name("build-version")
                .long("build-version")
                .value_name("VERSION")
                .help("The version being built")
                .takes_value(true)
                .required(true)
        )
        .arg(
            clap::Arg::with_name("build-version-alias")
                .long("build-version-alias")
                .value_name("VERSION")
                .help("The version aliases being built")
                .takes_value(true)
                .multiple(true)
        )
        .arg(
            clap::Arg::with_name("build-script")
                .long("build-script")
                .value_name("PATH")
                .help("The path to the build script to be run")
                .takes_value(true)
                .required(true)
        )
        .get_matches();
}
