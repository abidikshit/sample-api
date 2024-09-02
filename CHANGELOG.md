
# Changelog

## Date - 2024-09-02

### Added

- Created Dockerfile for building the Docker image.
- Created `CHANGELOG.md` to document changes.
- Added GitHub Actions workflow for building and publishing Docker images:
  - **`docker-build.yml`**:
    - Configured the workflow to build and push Docker images to GitHub Container Registry.
    - Added a `build-unit-test` job to set up Python, install dependencies, and run tests.
    - Added a `build-push` job to login to the GitHub Container Registry and build and push the Docker image.
