FROM alpine:latest

LABEL maintainer="Justin Toffel <biftin@tfwno.gf>"

RUN apk add --update openssh && \
    sed -i 's/\#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config

COPY docker-entrypoint.sh /usr/local/bin

EXPOSE 22

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/sshd", "-D" ]
