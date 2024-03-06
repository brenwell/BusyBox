# Build httpie-go on a big golang image
FROM golang:1.13 as builder
RUN mkdir /build 
RUN git clone https://github.com/nojima/httpie-go.git /build/httpie-go
WORKDIR /build/httpie-go
RUN CGO_ENABLED=0 go build -o http ./cmd/ht

# Create a stage to gather ca-certificates
FROM alpine:latest as certs
RUN apk --no-cache add ca-certificates

# Copy the executable and ca-certificates to the tiny busybox image
FROM busybox
COPY --from=builder /build/httpie-go/http /bin/
COPY --from=certs /etc/ssl/certs /etc/ssl/certs

# Verify SSL certificates
ENV SSL_CERT_DIR=/etc/ssl/certs

CMD ["/bin/http"]