FROM debian:latest

LABEL maintainer="Justin Toffel <biftin@tfwno.gf>"

RUN apt-get update && \
    apt-get install -y openssh-server && \
    sed -i 's/\#PermitRootLogin.*/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config

COPY docker-entrypoint.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

EXPOSE 22

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/sshd", "-D" ]

VOLUME /root/.ssh/authorized_keys
