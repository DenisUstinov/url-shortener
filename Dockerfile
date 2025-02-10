# Modules Caching
FROM golang:1.22 AS modules

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

# Build
FROM golang:1.22

WORKDIR /app

COPY --from=modules /go/pkg /go/pkg

COPY . .

RUN CGO_ENABLED=0 go build -o /my-app ./cmd/app

ENTRYPOINT ["/my-app"]