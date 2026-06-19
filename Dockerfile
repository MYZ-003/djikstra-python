FROM python:3.11-slim

WORKDIR /app

# Copy everything
COPY . .

# Generate the database
RUN cd database && python generate_db.py && cp graph.db ../backend/

# Install Python dependencies
RUN pip install -r backend/requirements.txt

# Run the server
WORKDIR /app/backend
CMD gunicorn --bind 0.0.0.0:$PORT server:app
