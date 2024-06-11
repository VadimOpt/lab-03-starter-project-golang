
FROM golang:1.16

WORKDIR /app

COPY go.mod go.sum .

RUN go mod download

COPY cmd ./cmd
COPY lib ./lib
COPY templates ./templates
COPY main.go .

RUN CGO_ENABLED=0 go build -o ./myapp

CMD ["./myapp", "serve"]
