FROM alpine:3.7

# Install tooling
ENV GORELEASER_VER 0.113.0
ENV GORELEASER_SHA 2379beebb6369b75ccead7f7a43269de700b51821feae3857701d106ed72bd63
ENV GOVER 1.14

RUN apk add curl \
    && curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/usr/bin sh

EXPOSE 50051
EXPOSE 9090

ENTRYPOINT ["arduino-cli","daemon"]
