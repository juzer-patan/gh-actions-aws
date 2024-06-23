# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Accept build arguments
ARG STAGING_DB_HOST=test
ARG STAGING_DB_USERNAME=World

# Set environment variables
ENV STAGING_DB_HOST=${STAGING_DB_HOST}
ENV STAGING_DB_USERNAME=${STAGING_DB_USERNAME}
# Install any needed packages specified in requirements.txt
# In this case, there are no additional packages, so this step is commented out
# COPY requirements.txt /app
# RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80



# Run hello.py when the container launches
CMD ["python", "hello.py"]
