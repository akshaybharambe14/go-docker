# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from the latest golang base image
FROM golang:latest as builder

# Add Maintainer Info
LABEL maintainer="Akshay Bharambe <akshaybharambe14@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Build the Go app on target alpine linux. 
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello .


######## Start a new stage from scratch #######
FROM alpine:latest

# Setup target. More info at https://github.com/gliderlabs/docker-alpine/blob/master/docs/usage.md
RUN apk --no-cache add ca-certificates

# Set working directory. Please note, we need to set arguments in this stage.
WORKDIR /root/

# for attaching a volume to the docker image
# Build Args
ARG LOG_DIR=/root/logs

# Create Log Directory
RUN mkdir -p ${LOG_DIR}

# Environment Variables
ENV LOG_FILE_LOCATION=${LOG_DIR}/app.log

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /app/hello .

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./hello"] 