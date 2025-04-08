# Use official Python image
FROM python:3.9-alpine

# Set the working directory inside the container
WORKDIR /app

# Install dependencies 
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app runner
COPY run_app.py .

# Copy application
COPY ./app/ ./app/

ENV PYTHONPATH="${PYTHONPATH}:/app/app"

# Expose the Flask app port
EXPOSE 5000
CMD ["python", "run_app.py"]

