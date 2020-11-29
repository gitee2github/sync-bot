# Build stage
FROM golang:1.15.5 AS build

ADD . /go-build

WORKDIR /go-build

ENV GOPROXY=https://goproxy.cn,direct

RUN go build -o /sync-bot


# Final stage
FROM centos:8

EXPOSE 1234

WORKDIR /

COPY --from=build /sync-bot /

CMD ["/sync-bot"]
