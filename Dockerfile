FROM golang:1.24-alpine AS build
WORKDIR /go/src

# Copying these files and downloading dependencies before copying in project
# code allows us to cache deps more often. Downloading deps can be relatively
# slow, so doing this can speed up local development a bit.
COPY go.mod ./
RUN go mod download -x
COPY . .
RUN go install -v ./...

FROM alpine:latest
RUN apk --no-cache add ca-certificates
EXPOSE 8080
COPY --from=build /go/bin/yogo /go/bin/yogo
CMD ["/go/bin/yogo"]
