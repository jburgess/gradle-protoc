FROM busybox AS builder

RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v3.11.2/protoc-3.11.2-linux-x86_64.zip

RUN unzip protoc-3.11.2-linux-x86_64.zip

FROM gradle:jdk11
COPY --from=builder /bin/protoc /usr/local/bin