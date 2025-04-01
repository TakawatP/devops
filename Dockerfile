FROM golang:1.21 AS builder

COPY go.mod ./
RUN go mod download

COPY . .
RUN go build -o goapp .

#Use minimal base image
FROM alpine:latest

COPY --from=builder  /devops .
EXPOSE 8080

CMD ["./goapp"]
