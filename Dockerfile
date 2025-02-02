# Use an official Python image
FROM python:3.11

# Create a non-root user
RUN addgroup --system celerygroup && adduser --system --ingroup celerygroup celeryuser

# Set working directory
WORKDIR /app

# Copy dependencies and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Change ownership of the directory
RUN chown -R celeryuser:celerygroup /app

# Switch to the non-root user
USER celeryuser

# Start Celery worker
CMD ["celery", "-A", "celery_worker.celery_app", "worker", "--loglevel=debug"]
