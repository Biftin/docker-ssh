FROM centos:7

LABEL maintainer="Justin Toffel <biftin@tfwno.gf>"

RUN yum install -y openssh-server

RUN sed -i 's/\#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config

COPY docker-entrypoint.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

EXPOSE 22

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/sshd", "-D" ]

VOLUME /root/.ssh/authorized_keys
