FROM busybox AS builder

ARG PROTOC_VERSION=3.11.2
RUN echo Building with protoc version: $PROTOC_VERSION

RUN wget "https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip"

RUN unzip protoc-$PROTOC_VERSION-linux-x86_64.zip

FROM gradle:jdk11
COPY --from=builder /bin/protoc /usr/local/bin