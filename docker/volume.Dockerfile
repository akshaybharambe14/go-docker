# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from the latest golang base image, use 'golang:1.13' for v.1.13
FROM golang:latest

# Add Maintainer Info
LABEL maintainer="Akshay Bharambe <akshaybharambe14@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR /app

# for attaching a volume to the docker image
# Build Args
ARG LOG_DIR=/app/logs

# Create Log Directory
RUN mkdir -p ${LOG_DIR}

# Environment Variables
ENV LOG_FILE_LOCATION=${LOG_DIR}/app.log

# Copy go mod and sum files
# COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
# RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Build the Go app
RUN go build -o hello .

# Expose port 8080 to the outside world
EXPOSE 8080

# Declare volumes to mount
VOLUME [${LOG_DIR}]

# Command to run the executable
CMD ["./hello"]