# Developer Workflow

## Simplified Ouatio DSpace Git Workflow

New code should be created in feature branches derived from the master
branch and merged in to the master branch in logical units.

Code should be well tested and considered ready for release before
merging into master. Nontrivial additions should also be reviewed by
the team prior to merge.

Release branches named release-YYYY.MM.DD should be created when
deploying code to production to snapshot the code that was deployed
and to provide a basis for hotfixes. 


## Connecting to the DSpace database

Use `psql -h 127.0.0.1 -U dspace dspace` to connect to the DSpace
user. We're using a hosted DB in production, so it's probably a good
idea to get used to not using the local connection in dev.