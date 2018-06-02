Versions
========

Whenever a build is triggered, the version being built is provided. This
version is usually a commit hash.

In addition a list of version aliases may be provided. These usually correspond
to branch and tag names. They are passed to the build script.

This means that each build is uniquely identified by the pair of the version
and the list of version aliases. Whenever such a pair is not yet present in the
database, a new build is run.
