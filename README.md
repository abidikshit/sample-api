
# Sample API

This is a sample API.

## Technology Used

- [X] [Python](https://www.python.org)
- [X] [FastAPI](https://fastapi.tiangolo.com)
- [X] [SQLAlchemy](https://www.sqlalchemy.org)
- [X] [Poetry](https://python-poetry.org)
- [X] [Flyway](https://www.red-gate.com/products/flyway/community/)
- [X] [Docker Compose](https://docs.docker.com/compose/install/)

## Setup

### Environment variables

The following environment variables are expected:

- ORIGINS: comma separated list of [allowed origins](https://fastapi.tiangolo.com/tutorial/cors/).
- POSTGRES_SERVER: URL of db server
- POSTGRES_USER
- POSTGRES_PASSWORD
- POSTGRES_DB: postgres DB name

### DB Adaptor

The [psycopg2](https://www.psycopg.org) adaptor is used. Note the [installation requirements](https://www.psycopg.org/docs/install.html) for the psycopg2 package. The [sample-api dependencies](pyproject.toml) use the psycopg2 package and not the psycopg2-binary package.

## Local Development

### Running Locally

- Run `docker compose up` command from the root directory to start the entire stack. The following will be started:
  - Postgres server
  - Flyway - it sets up the postgres tables and inserts some dev data.
  - sample-api server
- Environment variables are defined in the `docker-compose.yml`
- The `sample-api` folder is volume mounted, so any changes to the code will be reflected in the container
- The API's documentation is available at [http://localhost:3003/docs](http://localhost:3003/docs).

### Unit Tests

- Run `docker compose --profile test up` command to run the unit tests from the root directory. This will run the above services as well as the unit tests.
- The folder is volume mounted, so any changes to the code will be reflected in the container and run the unit tests again.

## The API

This is a simple API. It is not production-ready.

The API is based on the table schema defined in the [V1.0.0__init.sql](db/migrations/V1.0.0__init.sql) file. Note the foreign key constraint if you want to try the endpoints out.

The [http://localhost:3003/docs](http://localhost:3003/docs) page lists the available endpoints.

## Recent Changes

### Added

- Added Dockerfile to containerize the sample-api application.
- Created Dockerfile for building the Docker image.
- Created `CHANGELOG.md` to document changes.
- Added a new document detailing the setup of a test environment for the API. See [setup-test-environment.md](setup-test-environment.md) for more information.
