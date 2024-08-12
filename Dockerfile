# Stage 1: Build the openssl-fips-test binary
FROM golang:alpine AS builder
WORKDIR /app
COPY openssl-fips-test .
RUN go build -o openssl-fips-test

# Stage 2: Create the final image
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/openssl-fips-test .
