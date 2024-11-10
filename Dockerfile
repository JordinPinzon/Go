# Build stage
FROM golang:1.23-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files and download dependencies
COPY go.mod ./
RUN go mod download

# Copy the rest of the application source code
COPY . .

# Compile the application
RUN go build -o hello-world

# Run stage
FROM alpine:latest

# Set the working directory in the container
WORKDIR /app

# Copy the compiled binary from the build stage
COPY --from=build /app/hello-world .

# Expose the port
EXPOSE 8081

# Run the application
CMD ["./hello-world"]
