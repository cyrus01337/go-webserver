FROM golang:1.22.6 AS base
WORKDIR /app

FROM base AS dependencies
WORKDIR /app

COPY . .
RUN --mount=type=cache,target=/store/go ["go", "mod", "download"]

FROM dependencies AS builder
ENV CGO_ENABLED=0
ENV GOOS=linux
WORKDIR /app

RUN --mount=type=cache,target=/store/app ["go", "build", "-o", "compiled"]

FROM alpine:3.24.1
WORKDIR /app

COPY --from=builder /app/compiled ./
COPY --from=builder /app/build/ ./build

CMD ["./compiled"]
