FROM golang:1.21 AS builder
WORKDIR /devops

COPY go.mod ./
RUN go mod download

COPY . .
RUN go build -o goapp .

#Use minimal base image
FROM alpine:latest
WORKDIR /devops

COPY --from=builder  /devops .
EXPOSE 8080

CMD ["./goapp"]
