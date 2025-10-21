# Dockerfile

# 1. Use an official Python runtime as a parent image
FROM python:3.11-slim

# 2. Set environment variables
# Prevents Python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1
# Ensures that Python output is sent straight to the terminal without buffering
ENV PYTHONUNBUFFERED 1

# 3. Set the working directory in the container
WORKDIR /app

# 4. Copy the requirements file and install dependencies
# This is done in a separate step to leverage Docker's layer caching.
# If requirements.txt doesn't change, Docker won't reinstall packages on subsequent builds.
COPY requirements.txt .
RUN pip install -r requirements.txt

# 5. Copy the rest of the application's code into the container
COPY . .