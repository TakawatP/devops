# -------- Stage 1: Builder --------
FROM golang:1.21 as builder

# Set working directory
WORKDIR /app

# Cache go modules
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the app
COPY . .

# Build the Go binary
RUN go build -o goapp .

# -------- Stage 2: Final image --------
FROM alpine:latest

# Install CA certificates (if your app makes HTTPS requests)
RUN apk --no-cache add ca-certificates

# Set working directory
WORKDIR /root/

# Copy the compiled binary from the builder
COPY --from=builder /app/goapp .

# Expose application port
EXPOSE 8080

# Start the application
CMD ["./goapp"]
