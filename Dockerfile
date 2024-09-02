# Use a slim Python image
FROM python:3.12-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Install Poetry
RUN pip install poetry

# Copy poetry configuration files
COPY pyproject.toml poetry.lock ./

# Install Python dependencies
RUN poetry install --no-root --only main

# Copy the rest of the application
COPY src/ src/

# Set the Python path
ENV PYTHONPATH=/usr/src/app/src

# Run the application
CMD ["poetry", "run", "python", "-m", "sample_api.main"]