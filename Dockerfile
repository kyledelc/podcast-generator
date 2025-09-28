FROM python:3.12-slim

# Install git (if needed by your workflow)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install dependencies
RUN pip install --no-cache-dir PyYAML

# Copy project files
COPY feed.py /app/feed.py
COPY entrypoint.sh /app/entrypoint.sh

# Make entrypoint executable
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
