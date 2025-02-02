# Use an official Python image
FROM python:3.11

# Set working directory
WORKDIR /app

# Copy dependencies and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Start Celery worker
CMD ["celery", "-A", "celery_worker.celery_app", "worker", "--loglevel=info"]
