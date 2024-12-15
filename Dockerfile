# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy only the dependency files to leverage Docker caching
COPY pyproject.toml poetry.lock ./

# Install Poetry
RUN pip install poetry

# Install dependencies
RUN poetry install --no-root --no-dev

# Copy the rest of the application code
COPY . .

# Make port 80 available to the world outside this container
EXPOSE 80

# Command to run your application
CMD ["python", "app.py"]
