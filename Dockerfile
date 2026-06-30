FROM golang:1.22.6 AS base
ARG build_directory
ENV BUILD_DIRECTORY="${build_directory:-dist/}"
WORKDIR /app

FROM base AS dependencies
WORKDIR /app

COPY . .
RUN --mount=type=cache,target=/store/go ["go", "mod", "download"]

FROM dependencies AS builder
ENV CGO_ENABLED=0
ENV GOOS=linux
WORKDIR /app

COPY --from=dependencies *.env .
RUN --mount=type=cache,target=/store/app ["go", "build", "-o", "compiled"]

FROM debian:bookworm
ARG build_directory
ENV BUILD_DIRECTORY="${build_directory:-dist/}"
WORKDIR /app

COPY --from=builder /app/compiled /app/*.env ./
COPY --from=builder /app/$BUILD_DIRECTORY ./$BUILD_DIRECTORY

CMD ["./compiled"]
