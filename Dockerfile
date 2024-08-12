FROM golang:alpine AS builder
WORKDIR /app
COPY openssl-fips-test .
RUN go build -o openssl-fips-test

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/openssl-fips-test .
