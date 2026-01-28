FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies for opencv, tensorflow, and pytorch
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose port
EXPOSE 8080

# Run gunicorn
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8080", "--timeout", "120", "--workers", "2"]
