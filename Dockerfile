FROM golang:1.23.3Add commentMore actions

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

RUN go get github.com/go-chi/chi/v5

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app

CMD ["/my_app"] 

RUN go mod tidy
