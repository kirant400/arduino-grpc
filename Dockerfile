FROM alpine:3.7
LABEL io.openshift.expose-services 50051:tcp,9090:http
LABEL io.k8s.description Arduino CLI which expose gRPC

ENV homedir /home/swuser
# Install latest arduino-cli
#RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN addgroup -S swuser -g 433 && \
adduser -u 431 -D -S swuser -G swuser -h ${homedir} && \
chown -R swuser:swuser ${homedir} && \
mkdir -p /data/swuser && \
chown -R swuser:swuser /data/swuser
VOLUME /data/swuser
WORKDIR ${homedir}/app
RUN apk add curl \
    && curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=${homedir}/app sh
COPY arduino-cli.yaml ${homedir}/app
#RUN chmod -R 755 /home/node/app
RUN chown -R swuser:swuser ${homedir}/app

#RUN chown -R swuser:swuser /var/data
EXPOSE 50051
EXPOSE 9090
# Tell docker that all future commands should run as the appuser user
RUN echo 'we are running some # of cool things'
USER swuser
#VOLUME ${homedir}/data
#ENTRYPOINT ["./arduino-cli","daemon","--config-file","${homedir}/app/arduino-cli.yaml"]
#ENTRYPOINT ["/bin/sh" ,"cd"]
#CMD [ "/bin/echo","hello world" ]
#ENTRYPOINT "/bin/echo hello world && tail -f /dev/null"
CMD ./arduino-cli daemon --config-file ${homedir}/app/arduino-cli.yaml && tail -f /dev/null
#ENTRYPOINT ["tail", "-f", "/dev/null"]
