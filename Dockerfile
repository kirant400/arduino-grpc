FROM alpine:3.7

# Install latest arduino-cli
RUN adduser node root
COPY . /home/node/app
WORKDIR /home/node/app
RUN apk add curl \
    && curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/home/node/app sh

RUN chmod -R 775 /home/node/app
RUN chown -R node:root /home/node/app

EXPOSE 50051
EXPOSE 9090
# Tell docker that all future commands should run as the appuser user
USER 1000
CMD ["./arduino-cli","daemon","--config-file","/home/node/app/arduino-cli.yaml"]

